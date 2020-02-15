import 'dart:math';

import 'package:flutter/material.dart';

class TransformSliderWidget extends StatefulWidget {
  @override
  _TransformSliderWidgetState createState() => _TransformSliderWidgetState();
}

class _TransformSliderWidgetState extends State<TransformSliderWidget> {
  PageController pageController;
  double viewportFraction = 0.8;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: viewportFraction)
      ..addListener(() {
        setState(() {
          pageOffset = pageController.page;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemBuilder: (context, index) {
        double scale = max(viewportFraction, (1 - (pageOffset - index).abs()) + viewportFraction);
        double angle = (pageOffset - index).abs();
        if (angle > 0.5) {
          angle = 1 - angle;
        }
        return Container(
          padding: EdgeInsets.only(right: 10, left: 20, top: 100 - scale * 25, bottom: 50),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            alignment: Alignment.center,
            child: Image.asset(
              'images/owl.jpg',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      itemCount: 5,
    );
  }
}
