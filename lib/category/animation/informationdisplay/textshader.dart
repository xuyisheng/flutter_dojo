import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class TextShaderWidget extends StatefulWidget {
  @override
  _TextShaderWidgetState createState() => _TextShaderWidgetState();
}

class _TextShaderWidgetState extends State<TextShaderWidget> with SingleTickerProviderStateMixin {
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
    return Column(
      children: <Widget>[
        MainTitleWidget('通过修改LinearGradient的Stop实现动画效果'),
        AnimatedBuilder(
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
        ),
      ],
    );
  }
}
