import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class BounceTextWidget extends StatefulWidget {
  @override
  _BounceTextWidgetState createState() => _BounceTextWidgetState();
}

class _BounceTextWidgetState extends State<BounceTextWidget> with TickerProviderStateMixin {
  List<String> strList = ['My ', 'name  ', 'is ', 'Xu ', 'YiSheng !'];
  List<AnimationController> strControllers = [];
  List<CurvedAnimation> stringAnimation = [];
  var style = TextStyle(fontSize: 30);

  @override
  void initState() {
    super.initState();
    strList.forEach(
      (s) {
        var controller = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
        strControllers.add(controller);
        stringAnimation.add(CurvedAnimation(parent: controller, curve: Curves.easeInOutBack));
      },
    );
  }

  void startAnim() async {
    for (int i = 0; i < strList.length; i++) {
      Future.delayed(Duration(milliseconds: i * 100), () {
        strControllers[i].reset();
        strControllers[i].forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('通过Future.delayed实行延迟动画效果'),
        Row(
          children: strList.asMap().keys.map((v) {
            return AnimatedStrWidget(
              animation: stringAnimation[v],
              child: Text(strList[v], style: style),
            );
          }).toList(),
        ),
        RaisedButton(
          onPressed: () => startAnim(),
          child: Text('Start'),
        ),
      ],
    );
  }
}

class AnimatedStrWidget extends AnimatedWidget {
  final Tween<double> opacityTween = Tween(begin: 0, end: 1);
  final Tween<Offset> offsetTween = Tween(begin: Offset(0, 3), end: Offset(0, 0));
  final Widget child;

  AnimatedStrWidget({Key key, @required Animation<double> animation, @required this.child})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, widget) {
        return Opacity(
          opacity: opacityTween.animate(animation).value.clamp(0.0, 1.0),
          child: SlideTransition(
            position: offsetTween.animate(animation),
            child: child,
          ),
        );
      },
    );
  }
}
