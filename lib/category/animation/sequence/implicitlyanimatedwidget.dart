import 'package:flutter/material.dart';

class ImplicitlyAnimatedWidgetWidget extends StatefulWidget {
  @override
  _ImplicitlyAnimatedWidgetWidgetState createState() => _ImplicitlyAnimatedWidgetWidgetState();
}

class _ImplicitlyAnimatedWidgetWidgetState extends State<ImplicitlyAnimatedWidgetWidget> {
  Color _decorationColor = Colors.blue;
  var duration = Duration(seconds: 2);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedDecoratedBox(
          duration: duration,
          decoration: BoxDecoration(color: _decorationColor),
          child: FlatButton(
            onPressed: () {
              setState(() => _decorationColor = Colors.red);
            },
            child: Text(
              "change",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );
  final BoxDecoration decoration;
  final Widget child;

  @override
  _AnimatedDecoratedBoxState createState() {
    return _AnimatedDecoratedBoxState();
  }
}

class _AnimatedDecoratedBoxState extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween _decoration;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    // 用于更新Tween的初始值
    _decoration = visitor(_decoration, widget.decoration, (value) => DecorationTween(begin: value));
  }
}
