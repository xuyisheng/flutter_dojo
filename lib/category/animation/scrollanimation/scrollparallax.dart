import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ScrollParallaxWidget extends StatefulWidget {
  @override
  _ScrollParallaxWidgetState createState() => _ScrollParallaxWidgetState();
}

class _ScrollParallaxWidgetState extends State<ScrollParallaxWidget> {
  static const maxLeftOffset = 100;

  var child1Height = 300.0;
  var child2Height = 300.0;
  var child3Height = 300.0;

  var maxScrollOffset = 0.0;
  var scrollOffset = 0;

  var keyContainer = GlobalKey();

  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        setState(() => scrollOffset = scrollController.offset.toInt());
      });
    SchedulerBinding.instance.endOfFrame.then((value) {
      RenderBox renderBox = keyContainer.currentContext.findRenderObject();
      maxScrollOffset = child1Height + child2Height + child3Height - renderBox.size.height;
      setState(() {});
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: keyContainer,
      physics: ClampingScrollPhysics(),
      controller: scrollController,
      child: Container(
        height: child1Height + child2Height + child3Height,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: buildChild1(),
              left: 0,
              right: 0,
              top: 0,
            ),
            Positioned(
              child: buildChild2(),
              left: scrollOffset / maxScrollOffset * maxLeftOffset,
              right: 0,
              top: child1Height,
            ),
            Positioned(
              child: buildChild3(),
              left: 0,
              right: scrollOffset / maxScrollOffset * maxLeftOffset,
              top: child1Height + child2Height,
            ),
          ],
        ),
      ),
    );
  }

  buildChild1() {
    return Card(
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: child1Height,
        child: Center(
          child: Text(
            'Card',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  buildChild2() {
    return Card(
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: child2Height,
        child: Center(
          child: Text(
            'Card',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  buildChild3() {
    return Card(
      color: Colors.purple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: child3Height,
        child: Center(
          child: Text(
            'Card',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
