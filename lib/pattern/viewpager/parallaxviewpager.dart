import 'dart:math' as math;

import 'package:flutter/material.dart';

class ParallaxViewPagerWidget extends StatefulWidget {
  @override
  _ParallaxViewPagerWidgetState createState() => _ParallaxViewPagerWidgetState();
}

class _ParallaxViewPagerWidgetState extends State<ParallaxViewPagerWidget> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) {
          return CardPageWidget(pageOffset - index);
        },
        itemCount: 2,
      ),
    );
  }
}

class CardPageWidget extends StatelessWidget {
  final double offset;

  CardPageWidget(this.offset);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.asset(
                'images/pattern_bg.png',
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.none,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Transform.translate(
                offset: Offset(-offset * MediaQuery.of(context).size.width / 2, 0),
                child: Text(
                  'TextInLine',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
