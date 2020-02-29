import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ShaderMaskWidget extends StatefulWidget {
  @override
  _ShaderMaskWidgetState createState() => _ShaderMaskWidgetState();
}

class _ShaderMaskWidgetState extends State<ShaderMaskWidget> {
  GlobalKey myTextKey = GlobalKey();

  RenderBox myTextRenderBox;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => myTextRenderBox = myTextKey.currentContext.findRenderObject());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('图形遮罩'),
        ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(colors: [Colors.red, Colors.blue], stops: [0, 0.5]).createShader(rect);
          },
          child: Image.asset('images/logo.png'),
          blendMode: BlendMode.srcIn,
        ),
        MainTitleWidget('文字遮罩'),
        Text(
          'Hello Gradients!',
          key: myTextKey,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = getTextGradient(myTextRenderBox),
          ),
        )
      ],
    );
  }
}

Shader getTextGradient(RenderBox renderBox) {
  if (renderBox == null) return null;
  return LinearGradient(
    colors: <Color>[Colors.green, Colors.red],
  ).createShader(
    Rect.fromLTWH(
      renderBox.localToGlobal(Offset.zero).dx,
      renderBox.localToGlobal(Offset.zero).dy,
      renderBox.size.width,
      renderBox.size.height,
    ),
  );
}
