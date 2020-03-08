import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class BubbleWidget extends StatelessWidget {
  bubbleBody() {
    return Stack(
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Image.asset(
              'images/pattern_triangle.png',
              width: 30,
              height: 18,
            )),
        Container(
          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
          decoration: BoxDecoration(
            image: DecorationImage(
              centerSlice: Rect.fromLTWH(19, 13, 8, 8),
              image: AssetImage('images/pattern_rect.png'),
            ),
          ),
          constraints: BoxConstraints(
            minWidth: 48,
            maxWidth: 200,
          ),
          padding: EdgeInsets.fromLTRB(18.5, 3, 14.5, 20),
          child: Text(
            '通过设置centerSlice属性来实现类似Android .9图的效果',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('使用Image'),
        bubbleBody(),
        MainTitleWidget('使用自定义RenderObject'),
        BubbleMessage(
          painter: BubblePainter(),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 250.0,
              minWidth: 50.0,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'A superclass for RenderObject Widgets that configure RenderObject',
              softWrap: true,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color(0xff188aff)
      ..style = PaintingStyle.fill;
    var height = size.height;
    var width = size.width;
    final Path bubble = Path()
      ..moveTo(width - 22.0, height)
      ..lineTo(17.0, height)
      ..cubicTo(7.61, height, 0.0, height - 7.61, 0.0, height - 17.0)
      ..lineTo(0.0, 17.0)
      ..cubicTo(0.0, 7.61, 7.61, 0.0, 17.0, 0.0)
      ..lineTo(width - 21, 0.0)
      ..cubicTo(width - 11.61, 0.0, width - 4.0, 7.61, width - 4.0, 17.0)
      ..lineTo(width - 4.0, height - 11.0)
      ..cubicTo(width - 4.0, height - 1.0, width, height, width, height)
      ..lineTo(width + 0.05, height - 0.01)
      ..cubicTo(width - 4.07, height + 0.43, width - 8.16, height - 1.06, width - 11.04, height - 4.04)
      ..cubicTo(width - 16.0, height, width - 19.0, height, width - 22.0, height)
      ..close();
    canvas.drawPath(bubble, paint);
  }

  @override
  bool shouldRepaint(BubblePainter oldPainter) => true;
}

class BubbleMessage extends SingleChildRenderObjectWidget {
  BubbleMessage({
    Key key,
    this.painter,
    Widget child,
  }) : super(key: key, child: child);

  final CustomPainter painter;

  @override
  RenderCustomPaint createRenderObject(BuildContext context) {
    return RenderCustomPaint(
      painter: painter,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderCustomPaint renderObject) {
    renderObject..painter = painter;
  }
}
