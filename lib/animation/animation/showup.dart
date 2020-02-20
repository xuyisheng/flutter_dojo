import 'package:flutter/material.dart';

class ShowUpWidget extends StatefulWidget {
  @override
  _ShowUpWidgetState createState() => _ShowUpWidgetState();
}

class _ShowUpWidgetState extends State<ShowUpWidget> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
    animation.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          child: Opacity(
            opacity: animation.value,
            child: Transform(
              transform: Matrix4.translationValues(0.0, animation.value * -50.0, 0.0),
              child: Text(
                'Creates insets with symmetrical vertical and horizontal offsets.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
        RaisedButton(
          child: Text('Show'),
          onPressed: showUp,
        ),
      ],
    );
  }

  void showUp() {
    setState(() {
      animationController.reset();
      animationController.forward();
    });
  }
}
