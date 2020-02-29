import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class LayerBlendModeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('SaveLayer与图层混合'),
        SubtitleWidget('绘制的的内容只有在saveLayer产生的新图层中指定的rect中才生效'),
        SubtitleWidget('BlendMode和ColorFilter只有在合并图层的时候才会生效'),
        Center(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: CustomPaint(
              painter: MyPainter(),
            ),
          ),
        ),
        MainTitleWidget('图层混合动画'),
        Shimmer(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Colors.blue,
              Colors.red,
              Colors.blue,
            ],
            stops: const <double>[0.0, 0.5, 1.0],
          ),
          child: Center(
            child: Text(
              'xuyisheng',
              style: TextStyle(fontSize: 50),
            ),
          ),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.saveLayer(
      Rect.fromLTRB(0, 0, size.width * 0.7, size.height * 0.7),
      Paint()
        ..color = Colors.blue
        ..blendMode = BlendMode.difference,
    );
    // 填充区域
    canvas.drawPaint(Paint()..color = Colors.red);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Shimmer extends StatefulWidget {
  final Widget child;
  final Duration period;
  final Gradient gradient;

  const Shimmer({
    Key key,
    @required this.child,
    @required this.gradient,
    this.period = const Duration(milliseconds: 1000),
  }) : super(key: key);

  @override
  _ShimmerState createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.period);
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (BuildContext context, Widget child) => _Shimmer(
        child: child,
        gradient: widget.gradient,
        percent: _controller.value,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _Shimmer extends SingleChildRenderObjectWidget {
  final double percent;
  final Gradient gradient;

  const _Shimmer({
    Widget child,
    this.percent,
    this.gradient,
  }) : super(child: child);

  @override
  _ShimmerFilter createRenderObject(BuildContext context) {
    return _ShimmerFilter(percent, gradient);
  }

  @override
  void updateRenderObject(BuildContext context, _ShimmerFilter shimmer) {
    shimmer.percent = percent;
  }
}

class _ShimmerFilter extends RenderProxyBox {
  final Paint _clearPaint = Paint();
  final Paint _gradientPaint;
  final Gradient _gradient;
  double _percent;
  Rect _rect;

  _ShimmerFilter(
    this._percent,
    this._gradient,
  ) : _gradientPaint = Paint()..blendMode = BlendMode.srcIn;

  @override
  bool get alwaysNeedsCompositing => child != null;

  set percent(double newValue) {
    if (newValue == _percent) {
      return;
    }
    _percent = newValue;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) {
      return;
    }

    context.canvas.saveLayer(offset & child.size, _clearPaint);
    context.paintChild(child, offset);

    final double width = child.size.width;
    final double height = child.size.height;
    Rect rect;
    double dx, dy;
    dx = _offset(-width, width, _percent);
    dy = 0.0;
    rect = Rect.fromLTWH(offset.dx - width, offset.dy, 3 * width, height);
    if (_rect != rect) {
      _gradientPaint.shader = _gradient.createShader(rect);
      _rect = rect;
    }
    context.canvas.translate(dx, dy);
    context.canvas.drawRect(rect, _gradientPaint);
    context.canvas.restore();
  }

  double _offset(double start, double end, double percent) {
    return start + (end - start) * percent;
  }
}
