import 'package:flutter/material.dart';

class DelayAnimListWidget extends StatefulWidget {
  @override
  _DelayAnimListWidgetState createState() => _DelayAnimListWidgetState();
}

class _DelayAnimListWidgetState extends State<DelayAnimListWidget> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  int listSize = 3;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List<Widget>.generate(
        listSize,
        (int index) {
          final int count = listSize;
          final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: animationController,
              curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn),
            ),
          );
          animationController.forward();
          return AnimListItem(
            animation: animation,
            animationController: animationController,
            callBack: () {},
          );
        },
      ),
    );
  }
}

class AnimListItem extends StatelessWidget {
  const AnimListItem({Key key, this.callBack, this.animationController, this.animation}) : super(key: key);

  final VoidCallback callBack;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(0.0, 50 * (1.0 - animation.value), 0.0),
            child: Center(
              child: Container(
                width: 200,
                child: Image.asset(
                  'images/book.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
