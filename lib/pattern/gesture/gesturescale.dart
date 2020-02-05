import 'package:flutter/material.dart';

class GestureScaleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaleImage(url: 'images/book.jpg');
  }
}

class ScaleImage extends StatefulWidget {
  const ScaleImage({Key key, this.url}) : super(key: key);
  final url;

  @override
  State<StatefulWidget> createState() {
    return ScaleImageState();
  }
}

class ScaleImageState extends State<ScaleImage> with SingleTickerProviderStateMixin {
  Offset _offset = Offset.zero;
  double _scale = 1.0;
  Offset _normalizedOffset;
  double _previousScale;

  Offset _clampOffset(Offset offset) {
    final Size size = context.size;
    // widget的屏幕宽度
    final Offset minOffset = Offset(size.width, size.height) * (1.0 - _scale);
    // 限制他的最小尺寸
    return Offset(offset.dx.clamp(minOffset.dx, 0.0), offset.dy.clamp(minOffset.dy, 0.0));
  }

  void _handleOnScaleStart(ScaleStartDetails details) {
    setState(() {
      _previousScale = _scale;
      _normalizedOffset = (details.focalPoint - _offset) / _scale;
    });
  }

  void _handleOnScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      // 限制放大倍数 1~3倍
      _scale = (_previousScale * details.scale).clamp(1.0, 3.0);
      _offset = _clampOffset(details.focalPoint - _normalizedOffset * _scale);
    });
  }

  void _handleOnScaleEnd(ScaleEndDetails details) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: _handleOnScaleStart,
      onScaleUpdate: _handleOnScaleUpdate,
      onScaleEnd: _handleOnScaleEnd,
      child: ClipRect(
        child: Transform(
          transform: Matrix4.identity()
            ..translate(_offset.dx, _offset.dy)
            ..scale(_scale),
          child: Image.asset(
            widget.url,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
