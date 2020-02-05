import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CurveWidget extends StatefulWidget {
  @override
  _CurveWidgetState createState() => _CurveWidgetState();
}

class _CurveWidgetState extends State<CurveWidget> {
  Widget demo;

  @override
  void initState() {
    super.initState();
    demo = LoadingAnim();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: demo,
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("Loading"),
                onTap: () {
                  setState(() {
                    demo = LoadingAnim();
                  });
                },
              ),
              ListTile(
                title: Text("Easing"),
                onTap: () {
                  setState(() {
                    demo = Easing();
                  });
                },
              ),
              ListTile(
                title: Text("Delay"),
                onTap: () {
                  setState(() {
                    demo = Delay();
                  });
                },
              ),
              ListTile(
                title: Text("Parent"),
                onTap: () {
                  setState(() {
                    demo = Parent();
                  });
                },
              ),
              ListTile(
                title: Text("Demo"),
                onTap: () {
                  setState(() {
                    demo = Demo();
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Delay extends StatefulWidget {
  @override
  _DelayState createState() => _DelayState();
}

class _DelayState extends State<Delay> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  Animation<double> _animationDelay;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animation = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _animationDelay = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.4,
          1,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    return Container(
      child: AnimatedBuilder(
          animation: _animation,
          builder: (context, widget) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 50,
                  margin: EdgeInsets.only(
                    left: _animation.value,
                  ),
                  color: Colors.red,
                ),
                Container(
                  width: 80,
                  height: 50,
                  margin: EdgeInsets.only(
                    top: 30,
                    left: _animationDelay.value,
                  ),
                  color: Colors.blue,
                ),
              ],
            );
          }),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  AnimationManager _animationManager;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    _animationManager = AnimationManager(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) {
        return Stack(
          children: <Widget>[
            Opacity(
              opacity: _animationManager.bgOpacity.value,
              child: SizedBox.expand(
                child: Image.asset(
                  "images/anim_bg.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: _animationManager.bgBlur.value,
                sigmaY: _animationManager.bgBlur.value,
              ),
              child: Transform.scale(
                scale: _animationManager.avatarSize.value,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                  child: CircleAvatar(
                    child: Text('Xu'),
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'XuYisheng',
                    style: TextStyle(
                      color: Colors.white.withOpacity(_animationManager.textAnim1.value),
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Shanghai China',
                    style: TextStyle(
                      color: Colors.white.withOpacity(_animationManager.textAnim2.value),
                      fontSize: 12,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    width: _animationManager.dividerAnim.value,
                    height: 2,
                    color: Colors.white,
                  ),
                  Text(
                    'Android群英传',
                    style: TextStyle(
                      color: Colors.white.withOpacity(_animationManager.textAnim3.value),
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '资深Android架构师',
                    style: TextStyle(
                      color: Colors.white.withOpacity(_animationManager.textAnim3.value),
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Flutter修仙指南',
                    style: TextStyle(
                      color: Colors.white.withOpacity(_animationManager.textAnim3.value),
                      fontSize: 18,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                      _animationManager.imageAnim.value,
                      0,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Icon(
                        Icons.local_florist,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class AnimationManager {
  final AnimationController controller;
  final Animation<double> bgOpacity;
  final Animation<double> bgBlur;
  final Animation<double> avatarSize;
  final Animation<double> textAnim1;
  final Animation<double> textAnim2;
  final Animation<double> dividerAnim;
  final Animation<double> textAnim3;
  final Animation<double> imageAnim;

  AnimationManager(this.controller)
      : bgOpacity = Tween(begin: 1.0, end: 0.8).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.2,
              1.0,
              curve: Curves.easeInOut,
            ),
          ),
        ),
        bgBlur = Tween(begin: 0.0, end: 10.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.5,
            1.0,
            curve: Curves.easeInOut,
          ),
        )),
        avatarSize = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.2,
            1.0,
            curve: Curves.elasticOut,
          ),
        )),
        textAnim1 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.1,
            0.5,
            curve: Curves.easeInOut,
          ),
        )),
        textAnim2 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.5,
            0.7,
            curve: Curves.easeInOut,
          ),
        )),
        dividerAnim = Tween(begin: 0.0, end: 200.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.5,
            1.0,
            curve: Curves.easeInOut,
          ),
        )),
        textAnim3 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.7,
            1.0,
            curve: Curves.easeInOut,
          ),
        )),
        imageAnim = Tween(begin: -75.0, end: 0.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.7,
            1.0,
            curve: Curves.easeInOut,
          ),
        ));
}

class Easing extends StatefulWidget {
  @override
  _EasingState createState() => _EasingState();
}

class _EasingState extends State<Easing> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _easingAnimIn;
  Animation<double> _easingAnimOut;
  double width;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double containerWidth = 100;
    _easingAnimIn = Tween(begin: -containerWidth, end: width).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0,
          0.5,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    _easingAnimOut = Tween(begin: 0.0, end: width).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.5,
          1,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    _controller.repeat();
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, widget) {
        return Transform.translate(
          offset: Offset((_easingAnimIn.value - containerWidth) / 2, 0.0),
          child: Transform.translate(
            offset: Offset(_easingAnimOut.value, 0.0),
            child: Container(
              color: Colors.red,
              width: containerWidth,
              height: containerWidth,
            ),
          ),
        );
      },
    );
  }
}

class LoadingAnim extends StatefulWidget {
  @override
  _LoadingAnimState createState() => _LoadingAnimState();
}

class _LoadingAnimState extends State<LoadingAnim> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<BorderRadius> _animation1;
  Animation<BorderRadius> _animation2;
  Animation<BorderRadius> _animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation1 = animBuilder(0);
    _animation2 = animBuilder(1);
    _animation3 = animBuilder(2);
    _controller.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        _controller.reverse();
      } else if (state == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
  }

  Animation<BorderRadius> animBuilder(int index) {
    return BorderRadiusTween(
      begin: BorderRadius.circular(0.0),
      end: BorderRadius.circular(50.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(index * 0.33, (index + 1) * 0.33),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimItem(
            animation: _animation1,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: AnimItem(
              animation: _animation2,
            ),
          ),
          AnimItem(
            animation: _animation3,
          ),
        ],
      ),
    );
  }
}

class AnimItem extends AnimatedWidget {
  AnimItem({Key key, Animation<BorderRadius> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;

    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: animation.value,
      ),
      width: 50,
      height: 50,
    );
  }
}

class Parent extends StatefulWidget {
  @override
  ParentState createState() => ParentState();
}

class ParentState extends State<Parent> with TickerProviderStateMixin {
  Animation growingAnimation;
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    growingAnimation =
        Tween(begin: 10.0, end: 100.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    animation = Tween(begin: -0.25, end: 0.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    ))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return new Scaffold(
              body: new Align(
                  alignment: Alignment.center,
                  child: new Container(
                      child: new Center(
                          child: new ListView(shrinkWrap: true, children: <Widget>[
                    Transform(
                        transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
                        child: Center(
                            child: AnimatedBuilder(
                          animation: growingAnimation,
                          builder: (BuildContext context, Widget child) {
                            return new Center(
                                child: Container(
                              height: growingAnimation.value,
                              width: growingAnimation.value * 2,
                              color: Colors.black12,
                            ));
                          },
                        ))),
                    Transform(
                        transform: Matrix4.translationValues(
                          animation.value * width,
                          0.0,
                          0.0,
                        ),
                        child: new Center(
                            child: new Container(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            width: 200.0,
                            height: 100.0,
                            color: Colors.black12,
                          ),
                        ))),
                  ])))));
        });
  }
}
