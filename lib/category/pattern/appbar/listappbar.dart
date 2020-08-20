import 'package:flutter/material.dart';

class ListAppBarWidget extends StatefulWidget {
  @override
  _ListAppBarWidgetState createState() => _ListAppBarWidgetState();
}

class _ListAppBarWidgetState extends State<ListAppBarWidget> with TickerProviderStateMixin {
  Animation<double> topBarAnimation;
  AnimationController animationController;

  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0,
          0.5,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 && scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            ListView.builder(
              controller: scrollController,
              padding: EdgeInsets.only(top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top + 24),
              itemCount: 9,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                animationController.forward();
                return Container(
                  height: 80,
                  margin: EdgeInsets.all(16),
                  color: Colors.blueAccent,
                );
              },
            ),
            Column(
              children: <Widget>[
                AnimatedBuilder(
                  animation: animationController,
                  builder: (BuildContext context, Widget child) {
                    return FadeTransition(
                      opacity: topBarAnimation,
                      child: Transform(
                        transform: Matrix4.translationValues(0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(topBarOpacity),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(color: Colors.grey.withOpacity(0.4 * topBarOpacity), offset: const Offset(1.1, 1.1), blurRadius: 10.0),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: MediaQuery.of(context).padding.top),
                              Padding(
                                padding: EdgeInsets.only(left: 16, right: 16, top: 16 - 8.0 * topBarOpacity, bottom: 12 - 8.0 * topBarOpacity),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'XuYisheng',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 22 + 6 - 6 * topBarOpacity,
                                            letterSpacing: 1.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
