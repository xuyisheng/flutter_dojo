import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class HeroWidget extends StatefulWidget {
  @override
  _HeroWidgetState createState() => _HeroWidgetState();
}

class _HeroWidgetState extends State<HeroWidget> {
  @override
  void initState() {
    super.initState();
    timeDilation = 5;
  }

  @override
  void dispose() {
    super.dispose();
    timeDilation = 1;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MainTitleWidget('Hero基本使用'),
          SubtitleWidget('共享元素动画效果'),
          Hero(
            tag: 'hero',
            child: ClipOval(
              child: Container(
                width: 60,
                height: 60,
                color: Colors.yellow,
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (context) => HeroSecondPage('hero')),
              );
            },
            child: Text('Goto'),
          ),
          MainTitleWidget('自定义Hero动画'),
          SubtitleWidget('通过placeholderBuilder设置Hero占位Widget'),
          Hero(
            tag: 'custom_hero1',
            placeholderBuilder: (context, size, widget) {
              return ClipOval(
                child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey,
                ),
              );
            },
            child: ClipOval(
              child: Container(
                width: 60,
                height: 60,
                color: Colors.yellow,
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (context) => HeroSecondPage('custom_hero1')),
              );
            },
            child: Text('Goto'),
          ),
          SubtitleWidget('通过flightShuttleBuilder设置Hero过渡中动画效果'),
          Hero(
            tag: 'custom_hero2',
            flightShuttleBuilder: (flightContext, animation, direction, fromContext, toContext) {
              return Icon(
                Icons.add,
                size: 50,
              );
            },
            child: ClipOval(
              child: Container(
                width: 60,
                height: 60,
                color: Colors.yellow,
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (context) => HeroSecondPage('custom_hero2')),
              );
            },
            child: Text('Goto'),
          ),
          SubtitleWidget('Hero动画结合PageRoute动画'),
          Hero(
            tag: 'custom_hero3',
            child: ClipOval(
              child: Container(
                width: 60,
                height: 60,
                color: Colors.yellow,
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, anim1, anim2) {
                      return HeroSecondPage('custom_hero3');
                    },
                    transitionDuration: Duration(seconds: 1),
                    transitionsBuilder: (context, anim1, anim2, Widget child) {
                      return FadeTransition(
                        opacity: anim1.drive(CurveTween(curve: Curves.easeIn)),
                        child: child,
                      );
                    }),
              );
            },
            child: Text('Goto'),
          )
        ],
      ),
    );
  }
}

class HeroSecondPage extends StatelessWidget {
  final String tag;

  HeroSecondPage(this.tag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Hero(
            tag: tag,
            child: ClipOval(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.orange,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
