import 'package:flutter/material.dart';

const _horizontalPadding = 32.0;
const _carouselItemMargin = 8.0;

class AnimSliderWidget extends StatefulWidget {
  @override
  _AnimSliderWidgetState createState() => _AnimSliderWidgetState();
}

class _AnimSliderWidgetState extends State<AnimSliderWidget> with SingleTickerProviderStateMixin {
  PageController pageController;
  int currentPage = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final width = MediaQuery.of(context).size.width;
    final padding = (_horizontalPadding * 2) - (_carouselItemMargin * 2);
    pageController = PageController(
      initialPage: currentPage,
      viewportFraction: (width - padding) / width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.redAccent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        child: PageView(
          onPageChanged: (index) {
            setState(() => currentPage = index);
          },
          controller: pageController,
          children: <Widget>[
            for (int i = 0; i < 5; i++) buildItem(i),
          ],
        ),
      ),
    );
  }

  Widget buildItem(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
        } else {
          // If haveDimensions is false, use _currentPage to calculate value.
          value = (currentPage - index).toDouble();
        }
        value = (1 - (value.abs() * .5)).clamp(0, 1).toDouble();
        value = Curves.easeOut.transform(value);

        return Center(
          child: Transform(
            transform: Matrix4.diagonal3Values(1.0, value, 1.0),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.all(8),
              color: Colors.cyan,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
        );
      },
    );
  }
}
