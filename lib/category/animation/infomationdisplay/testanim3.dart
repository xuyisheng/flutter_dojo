import 'package:flutter/material.dart';

class TestAnim3Widget extends StatefulWidget {
  @override
  _TestAnim3WidgetState createState() => _TestAnim3WidgetState();
}

class _TestAnim3WidgetState extends State<TestAnim3Widget> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 3))..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, widget) {
        return ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              colors: [Colors.grey, Colors.white, Colors.grey],
              stops: [controller.value - 0.3, controller.value, controller.value + 0.3],
            ).createShader(
              Rect.fromLTWH(0, 0, rect.width, rect.height),
            );
          },
          child: Text(
            'Flutter' * 3,
            style: TextStyle(fontSize: 30),
          ),
          blendMode: BlendMode.srcIn,
        );
      },
    );
  }
}
