import 'package:flutter/material.dart';

class BollView extends CustomPainter {
  //颜色
  Color color;

  //数量
  int count;

  //集合放动画
  List<Animation<double>> listAnimators;

  BollView({this.color, this.count, this.listAnimators});

  @override
  void paint(Canvas canvas, Size size) {
    //绘制流程
    double bollRadius = (size.width - 15) / 8;
    Paint paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;
    //因为这个wiaget是80 球和球之间相隔5
    for (int i = 0; i < count; i++) {
      double value = listAnimators[i].value;
      //确定圆心 半径 画笔
      //第一个球 r
      //第二个球 5 + 3r
      //第三个球 15 + 5r
      //第四个球 30 + 7r
      //半径也是随着动画值改变
      canvas.drawCircle(
          Offset((i + 1) * bollRadius + i * bollRadius + i * 5, size.height / 2), bollRadius * (value > 1 ? (2 - value) : value), paint);
    }
  }

  //刷新是否重绘
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class LoadingType5 extends StatefulWidget {
  final Size size;
  final Color color;
  final int count;
  final int seconds;

  //默认四个小球 红色
  LoadingType5({this.size, this.seconds: 400, this.color: Colors.redAccent, this.count: 4});

  @override
  State<StatefulWidget> createState() {
    return LoadingType5State();
  }
}

//继承TickerProviderStateMixin，提供Ticker对象
class LoadingType5State extends State<LoadingType5> with TickerProviderStateMixin {
  //动画集合
  List<Animation<double>> animations = [];

  //控制器集合
  List<AnimationController> animationControllers = [];

  //颜色
  Animation<Color> colors;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.count; i++) {
      //创建动画控制器
      AnimationController animationController = AnimationController(vsync: this, duration: Duration(milliseconds: widget.count * widget.seconds));
      //添加到控制器集合
      animationControllers.add(animationController);
      //颜色随机
      colors = ColorTween(begin: Colors.red, end: Colors.green).animate(animationController);
      //创建动画 每个动画都要绑定控制器
      Animation<double> animation = Tween(begin: 0.1, end: 1.9).animate(animationController);
      animations.add(animation);
    }
    animations[0].addListener(() {
      //刷新
      setState(() {});
    });

    //延迟执行
    var delay = (widget.seconds ~/ (2 * animations.length - 2));
    for (int i = 0; i < animations.length; i++) {
      Future.delayed(Duration(milliseconds: delay * i), () {
        animationControllers[i]..repeat().orCancel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      //自定义画笔
      painter: BollView(color: colors.value, count: widget.count, listAnimators: animations),
      size: widget.size,
    );
  }

  //释放资源
  @override
  void dispose() {
    for (int i = 0; i < animationControllers.length; i++) {
      animationControllers[i].dispose();
    }
    super.dispose();
  }
}
