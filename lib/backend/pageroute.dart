import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';
import 'package:flutter_dojo/pages/main/navigatormanager.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class PageRouteWidget extends StatefulWidget {
  @override
  _PageRouteWidgetState createState() => _PageRouteWidgetState();
}

class _PageRouteWidgetState extends State<PageRouteWidget> {
  String show = '';
  var transitionSelection;

  @override
  void initState() {
    super.initState();
    transitionSelection = buildTransitionSlide;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('MaterialPageRoute'),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Page2('value from Page1');
              }),
            ).then((onValue) {
              setState(() => show = 'Value from Page2: ${onValue[0]} ${onValue[1]}');
            });
          },
          child: Text("Goto Page2"),
        ),
        Text(show),
        MainTitleWidget('静态路由'),
        SubtitleWidget('静态路由可以通过RouteSettings传值'),
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/page2", arguments: 'arguments from named Navigator');
          },
          child: Text("Goto Page2"),
        ),
        MainTitleWidget('路由替换'),
        SubtitleWidget('pushReplacement()、pushReplacementNamed()、popAndPushNamed()会在移除当前栈顶Widget的同时，入栈新的Widget'),
        RaisedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return Page2('路由替换');
              }),
            );
          },
          child: Text("Goto Page2 路由替换"),
        ),
        MainTitleWidget('路由移除'),
        SubtitleWidget('pushAndRemoveUntil()、pushNamedAndRemoveUntil()会移除当前栈的所有Widget，再入栈新的Widget'),
        RaisedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return Page2('路由移除');
              }),
              (Route<dynamic> rout) => false,
            );
          },
          child: Text("Goto Page2 路由移除"),
        ),
        MainTitleWidget('自定义PageRoute动画'),
        MultiSelectionWidget(
          'transition',
          [
            buildTransitionScale,
            buildTransitionSlide,
            buildTransitionFade,
            buildTransitionRotate,
            buildTransitionCompose
          ],
          ['Scale', 'Slide', 'Fade', 'Rotate', 'Compose'],
          (value) => setState(() => transitionSelection = value),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, anim1, anim2) {
                  return Page2('');
                },
                transitionDuration: Duration(seconds: 1),
                transitionsBuilder: transitionSelection,
              ),
            );
          },
          child: Text("Goto 自定义PageRoute Page2"),
        ),
        SubtitleWidget('通过设置secondaryAnimation实现进场和出场动画'),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, anim1, anim2) {
                  return Page2('');
                },
                transitionDuration: Duration(seconds: 1),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child,) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset.zero,
                        end: const Offset(-1.0, 0.0),
                      ).animate(secondaryAnimation),
                      child: child,
                    ),
                  );
                },
              ),
            );
          },
          child: Text("Page2进场出场动画"),
        ),
        MainTitleWidget('通过GlobalKey<NavigatorState>保存NavigatorState'),
        RaisedButton(
          onPressed: () {
            RouteManager.instance.push(MaterialPageRoute(builder: (context) => Page2('GlobalKey')));
          },
          child: Text("Goto Page2"),
        ),
        MainTitleWidget('通过NavigatorObserver保存NavigatorState'),
        RaisedButton(
          onPressed: () {
            NavigatorManager.getInstance().push('/page2', (context) => Page2('NavigatorObserver'));
          },
          child: Text("Goto Page2"),
        ),
        MainTitleWidget('路由监听'),
        RaisedButton(
          onPressed: () {
            // 监听
            NavigatorManager.getInstance().streamController.stream.listen((value) {
              debugPrint('Routes: ${value.toString()}');
            });
            NavigatorManager.getInstance().push('/page2', (context) => Page2('NavigatorObserver'));
            // 获取路由名
            var name = NavigatorManager.getInstance().currentRoute.settings.name;
            debugPrint(name);
          },
          child: Text("Goto Page2 With Observer"),
        ),
      ],
    );
  }

  Widget buildTransitionScale(context, anim1, anim2, Widget child) {
    return ScaleTransition(
      scale: anim1.drive(CurveTween(curve: Curves.bounceInOut)),
      child: child,
    );
  }

  Widget buildTransitionSlide(context, anim1, anim2, Widget child) {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeOut));

    return SlideTransition(
      position: tween.animate(anim1),
      child: child,
    );
  }

  Widget buildTransitionFade(context, anim1, anim2, Widget child) {
    return FadeTransition(
      opacity: anim1.drive(CurveTween(curve: Curves.easeIn)),
      child: child,
    );
  }

  Widget buildTransitionRotate(context, anim1, anim2, Widget child) {
    return RotationTransition(
      turns: anim1.drive(CurveTween(curve: Curves.easeIn)),
      child: child,
    );
  }

  Widget buildTransitionCompose(context, anim1, anim2, Widget child) {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    var tween1 = Tween(begin: begin, end: end);
    var tween2 = Tween(begin: 0.0, end: 1.0);

    return SlideTransition(
      position: tween1.chain(CurveTween(curve: Curves.easeIn)).animate(anim1),
      child: FadeTransition(
        opacity: tween2.chain(CurveTween(curve: Curves.easeIn)).animate(anim1),
        child: child,
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final valueFromPage1;

  Page2(this.valueFromPage1);

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    var value = settings.arguments;

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Page2'),
        ),
        body: Column(
          children: <Widget>[
            Text('from Page1: $valueFromPage1'),
            Text('from RouteSettings: $value'),
            RaisedButton(
              child: Text('Back to Page1 with value'),
              onPressed: () {
                Navigator.pop(context, ['Page2 value1', 'Page2 value2']);
              },
            ),
            RaisedButton(
              child: Text('Goto new page'),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, anim1, anim2) {
                      return Page2('');
                    },
                    transitionDuration: Duration(seconds: 1),
                    transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset.zero,
                            end: const Offset(-1.0, 0.0),
                          ).animate(secondaryAnimation),
                          child: child,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// 演示RouteObserver的使用
class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    print('didPush Page3');
  }

  @override
  void didPopNext() {
    print('didPopNext Page3');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Page3'),
        ),
        body: Text('Page3'),
      ),
    );
  }
}
