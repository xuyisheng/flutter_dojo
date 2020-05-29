import 'package:flutter/material.dart';

const String HERO_TAG = 'tag_detail';

class CustomHeroWidget extends StatefulWidget {
  @override
  _CustomHeroWidgetState createState() => _CustomHeroWidgetState();
}

class _CustomHeroWidgetState extends State<CustomHeroWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, anim1, anim2) {
                  return DetailPage();
                },
                transitionDuration: Duration(milliseconds: 3000),
                transitionsBuilder: buildTransitionSlide,
              ),
            );
          },
          child: Hero(
            tag: HERO_TAG,
            child: Image.asset(
              'images/book.jpg',
              width: 100,
            ),
            placeholderBuilder: (context, size, child) {
              return Opacity(
                opacity: 0.2,
                child: child,
              );
            },
            createRectTween: (begin, end) {
              return MaterialRectArcTween(begin: begin, end: end);
            },
          ),
        ),
      ],
    );
  }

  Widget buildTransitionSlide(context, anim1, anim2, Widget child) {
    var begin = Offset(1.0, 0.0);
    var end = Offset.zero;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeOut));

    return SlideTransition(
      position: tween.animate(anim1),
      child: child,
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset('images/book1.jpeg'),
              Positioned(
                bottom: 0,
                right: 0,
                child: Hero(
                  tag: HERO_TAG,
                  child: Image.asset(
                    'images/book.jpg',
                    width: 100,
                  ),
                  flightShuttleBuilder: (
                    BuildContext flightContext,
                    Animation<double> animation,
                    HeroFlightDirection flightDirection,
                    BuildContext fromHeroContext,
                    BuildContext toHeroContext,
                  ) {
                    final Hero toHero = toHeroContext.widget;
                    return ScaleTransition(
                      scale: animation.drive(
                        Tween<double>(begin: 0.0, end: 1.0).chain(
                          CurveTween(
                            curve: Interval(0.0, 1.0, curve: Curves.easeIn),
                          ),
                        ),
                      ),
                      child: flightDirection == HeroFlightDirection.push
                          ? RotationTransition(
                              turns: animation,
                              child: toHero.child,
                            )
                          : FadeTransition(
                              opacity: animation.drive(
                                Tween<double>(begin: 0.0, end: 1.0).chain(
                                  CurveTween(
                                    curve: Interval(0.0, 1.0, curve: Curves.easeIn),
                                  ),
                                ),
                              ),
                              child: toHero.child,
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Text('My Book 《Android群英传》' * 20),
        ],
      ),
    );
  }
}
