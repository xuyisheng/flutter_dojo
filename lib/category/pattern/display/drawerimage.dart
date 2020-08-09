import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerImageWidget extends StatefulWidget {
  @override
  _DrawerImageWidgetState createState() => _DrawerImageWidgetState();
}

class _DrawerImageWidgetState extends State<DrawerImageWidget> {
  double factor = 0.5;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: SizedBox(
            width: 200,
            height: 300,
            child: Image.asset(
              'assets/images/owl.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: ClipPath(
            clipper: RectClipperVertical(factor),
            child: SizedBox(
              width: 200,
              height: 300,
              child: Image.asset(
                'assets/images/book.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 0.0,
              overlayColor: Colors.transparent,
              thumbShape: CustomThumbShape(16.0, Colors.white),
            ),
            child: RotatedBox(
              quarterTurns: 1,
              child: Slider(
                value: factor,
                onChanged: (double factor) => setState(() => this.factor = factor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RectClipperVertical extends CustomClipper<Path> {
  final double clipFactor;

  RectClipperVertical(this.clipFactor);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height * clipFactor);
    path.lineTo(size.width, size.height * clipFactor);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CustomThumbShape extends SliderComponentShape {
  final double _thumbRadius;
  final Color _thumbColor;

  CustomThumbShape(this._thumbRadius, this._thumbColor);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(_thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double textScaleFactor,
    double value,
    Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 4.0
      ..color = _thumbColor
      ..style = PaintingStyle.fill;

    final Paint paintStroke = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 4.0
      ..color = _thumbColor
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      center,
      _thumbRadius,
      paintStroke,
    );

    canvas.drawCircle(
      center,
      _thumbRadius - 6,
      paint,
    );

    canvas.drawRect(
      Rect.fromCenter(center: center, width: 4.0, height: parentBox.size.height),
      paint,
    );
  }
}
