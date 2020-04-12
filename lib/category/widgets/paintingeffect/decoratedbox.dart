import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class DecoratedBoxWidget extends StatefulWidget {
  @override
  _DecoratedBoxWidgetState createState() => _DecoratedBoxWidgetState();
}

class _DecoratedBoxWidgetState extends State<DecoratedBoxWidget> with SingleTickerProviderStateMixin {
  var tileModeSelection = TileMode.clamp;
  var imageRepeatSelection = ImageRepeat.noRepeat;
  AnimationController controller;
  Animation<Decoration> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    Decoration begin = ShapeDecoration(
        color: Colors.red,
        shape: Border.all(
          color: Colors.blue,
          width: 2.0,
        ));
    Decoration end = ShapeDecoration(
        color: Colors.yellow,
        shape: Border.all(
          color: Colors.purple,
          width: 8.0,
        ));
    animation = DecorationTween(begin: begin, end: end).animate(controller);

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('BoxDecoration基本使用'),
          DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              border: Border.all(
                color: const Color(0xFF000000),
                style: BorderStyle.solid,
                width: 4,
              ),
              borderRadius: BorderRadius.zero,
              shape: BoxShape.rectangle,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Color(0x66000000),
                  blurRadius: 10,
                  spreadRadius: 4,
                )
              ],
            ),
            child: Container(
              child: Container(
                width: 100,
                height: 100,
                padding: EdgeInsets.all(20),
                child: FlutterLogo(),
              ),
            ),
          ),
          MainTitleWidget('BoxDecoration Color and Shape'),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                ),
              ),
            ],
          ),
          MainTitleWidget('BoxDecoration LinearGradient'),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Colors.red,
                  Colors.blue,
                ],
              ),
            ),
          ),
          SubtitleWidget('设置渐变的起始点，即方向'),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.cyan],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: FlutterLogo(
              size: 100,
            ),
          ),
          SubtitleWidget('设置渐变的颜色列表对应的渐变区间'),
          Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              gradient: LinearGradient(
                colors: [Colors.red, Colors.cyan, Colors.yellow, Colors.green],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                tileMode: TileMode.clamp,
                stops: [0.3, 0.5, 0.7, 0.9],
              ),
            ),
            child: FlutterLogo(
              size: 100,
            ),
          ),
          MainTitleWidget('BoxDecoration TileMode'),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.cyan],
                begin: Alignment.centerRight,
                end: Alignment(0.5, 0),
                tileMode: tileModeSelection,
              ),
            ),
            child: FlutterLogo(
              size: 100,
            ),
          ),
          MultiSelectionWidget(
            'TileMode',
            TileMode.values,
            TileMode.values.map((value) {
              return value.toString().split('.')[1];
            }).toList(),
            (value) {
              setState(() => tileModeSelection = value);
            },
          ),
          MainTitleWidget('BoxDecoration RadialGradient'),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: const [Colors.yellow, Colors.blue],
                stops: const [0.4, 1],
              ),
            ),
          ),
          MainTitleWidget('BoxDecoration SweepGradient'),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              gradient: SweepGradient(
                colors: const [
                  Colors.blue,
                  Colors.green,
                  Colors.yellow,
                  Colors.red,
                  Colors.blue,
                ],
                stops: const [0, 0.25, 0.5, 0.75, 1],
              ),
            ),
          ),
          MainTitleWidget('DecorationImage'),
          Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              gradient: RadialGradient(
                colors: [Colors.red, Colors.cyan, Colors.purple, Colors.green],
                center: Alignment(0, 0),
                radius: 0.5,
                tileMode: TileMode.clamp,
                stops: [0.3, 0.5, 0.9, 1],
              ),
              image: DecorationImage(
                image: AssetImage('images/logo.png'),
              ),
            ),
            child: Container(
              width: 100,
              height: 100,
            ),
          ),
          SubtitleWidget('DecorationImage ColorFilter'),
          Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              gradient: RadialGradient(
                colors: [Colors.red, Colors.cyan, Colors.purple, Colors.green],
                center: Alignment(0, 0),
                radius: 0.5,
                tileMode: TileMode.clamp,
                stops: [0.3, 0.5, 0.9, 1],
              ),
              image: DecorationImage(
                image: AssetImage('images/logo.png'),
                colorFilter: ColorFilter.mode(Colors.red.withOpacity(0.5), BlendMode.color),
              ),
            ),
            child: Container(
              width: 100,
              height: 100,
            ),
          ),
          SubtitleWidget('DecorationImage ImageRepeat'),
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              image: DecorationImage(
                image: AssetImage('images/logo_small.png'),
                repeat: imageRepeatSelection,
              ),
            ),
            child: Container(
              width: 200,
              height: 200,
            ),
          ),
          MultiSelectionWidget(
            'ImageRepeat',
            ImageRepeat.values,
            ImageRepeat.values.map((value) {
              return value.toString().split('.')[1];
            }).toList(),
            (value) {
              setState(() => imageRepeatSelection = value);
            },
          ),
          MainTitleWidget('BoxDecoration Border'),
          Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 5,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
          SubtitleWidget('分别指定不同边框'),
          Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.green,
                    width: 5,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
          SubtitleWidget('BorderDirectional'),
          Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
            child: Container(
              decoration: BoxDecoration(
                border: BorderDirectional(
                  top: BorderSide(
                    color: Colors.green,
                    width: 5,
                    style: BorderStyle.solid,
                  ),
                  start: BorderSide(
                    color: Colors.green,
                    width: 5,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
          MainTitleWidget('BoxDecoration BorderRadius'),
          Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
          SubtitleWidget('BorderRadius.circular'),
          Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SubtitleWidget('BorderRadius.horizontal'),
          Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20),
                  right: Radius.circular(0),
                ),
              ),
            ),
          ),
          SubtitleWidget('BorderRadius.vertical'),
          Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                  bottom: Radius.circular(0),
                ),
              ),
            ),
          ),
          MainTitleWidget('BoxDecoration BoxShadow'),
          SubtitleWidget('混合多阴影，blur'),
          Container(
            width: 200,
            height: 200,
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.green,
                  width: 5,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red,
                    offset: Offset(20, 10),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.yellow,
                    offset: Offset(10, 5),
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(3.0, 3.0),
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          MainTitleWidget('DecoratedBoxTransition动画'),
          DecoratedBoxTransition(
            decoration: animation,
            child: SizedBox(
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
