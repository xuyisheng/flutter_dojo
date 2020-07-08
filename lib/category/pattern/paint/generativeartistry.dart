import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class GenerativeArtistryWidget extends StatefulWidget {
  @override
  _GenerativeArtistryWidgetState createState() => _GenerativeArtistryWidgetState();
}

class _GenerativeArtistryWidgetState extends State<GenerativeArtistryWidget> {
  var p1 = TiledLinesPainter(20);
  var p2 = JoyDivisionPainter(20, 300.0);
  var p3 = CubicDisarrayPainter(30.0, 300.0);
  var p4 = TriangularMeshPainter(300.0);
  var p5 = UnDeuxTroisPainter(300.0);
  var p6 = CirclePackingPainter(300.0);
  var p7 = HypnoticSquaresPainter(300.0);
  var p8 = PietMondrianPainter(300.0);
  CustomPainter painter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: painter,
            ),
          ),
          MultiSelectionWidget(
            'Generative \nArtistry',
            [
              p1,
              p2,
              p3,
              p4,
              p5,
              p6,
              p7,
              p8,
            ],
            [
              'TiledLinesPainter',
              'JoyDivisionPainter',
              'CubicDisarrayPainter',
              'TriangularMeshPainter',
              'UnDeuxTroisPainter',
              'CirclePackingPainter',
              'HypnoticSquaresPainter',
              'PietMondrianPainter',
            ],
            (value) => setState(() => painter = value),
          ),
        ],
      ),
    );
  }
}

//TiledLinesPainter(300)
class TiledLinesPainter extends CustomPainter {
  final double step;

  TiledLinesPainter(this.step);

  void _drawLine(Canvas canvas, double x, double y, double width, double height) {
    final bool isLeftToRight = Random().nextBool();
    final Paint paint = Paint()
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 2;
    Offset p1;
    Offset p2;
    if (isLeftToRight) {
      p1 = Offset(x, y);
      p2 = Offset(x + width, y + height);
    } else {
      p1 = Offset(x + width, y);
      p2 = Offset(x, y + height);
    }
    canvas.drawLine(p1, p2, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < size.height; y += step) {
        _drawLine(canvas, x, y, step, step);
      }
    }
  }

  bool shouldRepaint(TiledLinesPainter oldDelegate) => false;
}

//JoyDivisionPainter(20, 300.0)
class JoyDivisionPainter extends CustomPainter {
  final int step;
  final double sizeW;
  var lines = List<List<Point>>();
  var path = Path();

  JoyDivisionPainter(this.step, this.sizeW);

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < sizeW - step; i += step) {
      var line = List<Point>();
      for (var j = 0; j <= sizeW - step; j += step) {
        var random = Random().nextDouble() * step;
        var point = Point<double>(j.toDouble(), i.toDouble() + random);
        line.add(point);
      }
      lines.add(line);
    }

    for (var i = 0; i < lines.length; i++) {
      path.moveTo(lines[i][0].x, lines[i][0].y);
      for (var j = 0; j < lines[i].length - 2; j++) {
        var xc = (lines[i][j].x + lines[i][j + 1].x) / 2;
        var yc = (lines[i][j].y + lines[i][j + 1].y) / 2;
        path.quadraticBezierTo(lines[i][j].x, lines[i][j].y, xc, yc);
      }
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

//CubicDisarrayPainter(30.0, 300.0)
class CubicDisarrayPainter extends CustomPainter {
  final double cubicSize;
  final double sizeW;
  var randomDisplacement = 15;
  var rotateMultiplier = 20;
  var offset = 10;

  CubicDisarrayPainter(this.cubicSize, this.sizeW);

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < sizeW - cubicSize; i += cubicSize.toInt()) {
      for (var j = 0; j < sizeW - cubicSize; j += cubicSize.toInt()) {
        var plusOrMinus = Random().nextDouble() < 0.5 ? -1 : 1;
        var rotateAmt = j / sizeW * pi / 180 * plusOrMinus * Random().nextDouble() * rotateMultiplier;
        plusOrMinus = Random().nextDouble() < 0.5 ? -1 : 1;
        var translateAmt = j / sizeW * plusOrMinus * Random().nextDouble() * randomDisplacement;

        canvas.save();
        canvas.translate(i.toDouble() + translateAmt + offset, j.toDouble() + offset);
        canvas.rotate(rotateAmt);
        canvas.drawRect(
          Rect.fromLTRB(-cubicSize / 2, -cubicSize / 2, cubicSize / 2, cubicSize / 2),
          Paint()
            ..color = Colors.black
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2,
        );
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

//TriangularMeshPainter(300.0)
class TriangularMeshPainter extends CustomPainter {
  final double sizeW;

  TriangularMeshPainter(this.sizeW);

  drawTriangle(Offset a, Offset b, Offset c, Canvas canvas) {
    Path path = Path();
    path.moveTo(a.dx, a.dy);
    path.lineTo(b.dx, b.dy);
    path.lineTo(c.dx, c.dy);
    path.close();
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.grey[Random().nextInt(8) * 100 + 100]
        ..style = PaintingStyle.fill,
    );
  }

  randomValue(double gap) {
    return (Random().nextDouble() * 0.8 - 0.4) * gap;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var line = [], lines = [], gap = sizeW / 7;
    var odd = false;
    for (var y = .0; y < sizeW - gap; y += gap) {
      line = [];
      odd = !odd;
      for (var x = .0; x < sizeW - gap; x += gap) {
        var offset = Offset(x + randomValue(gap), y + randomValue(gap));
        if (odd) {
          offset = offset.translate(gap / 2, 0);
        }
        line.add(offset);
        canvas.drawPoints(
          PointMode.points,
          [offset],
          Paint()
            ..color = Colors.black
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2,
        );
      }
      lines.add(line);
    }

    var dotLine;
    odd = true;

    for (var y = 0; y < lines.length - 1; y++) {
      odd = !odd;
      dotLine = [];
      for (var i = 0; i < lines[y].length; i++) {
        dotLine.add(odd ? lines[y][i] : lines[y + 1][i]);
        dotLine.add(odd ? lines[y + 1][i] : lines[y][i]);
      }
      for (var i = 0; i < dotLine.length - 2; i++) {
        drawTriangle(dotLine[i], dotLine[i + 1], dotLine[i + 2], canvas);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

//UnDeuxTroisPainter(300.0)
class UnDeuxTroisPainter extends CustomPainter {
  final double sizeW;
  var step = 20.0;

  UnDeuxTroisPainter(this.sizeW);

  drawLine(double x, double y, double width, double height, List positions, Canvas canvas) {
    canvas.save();
    canvas.translate(x + width / 2, y + height / 2);
    canvas.rotate(Random().nextDouble() * 5);
    canvas.translate(-width / 2, -height / 2);

    for (var i = 0; i < positions.length; i++) {
      Path path = Path();
      path.moveTo(positions[i] * width, 0);
      path.lineTo(positions[i] * width, height);
      canvas.drawPath(
        path,
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
    }
    canvas.restore();
  }

  @override
  void paint(Canvas canvas, Size size) {
    var aThirdOfHeight = sizeW / 3;
    for (double y = 0; y < sizeW - step; y += step) {
      for (double x = 0; x < sizeW - step; x += step) {
        if (y < aThirdOfHeight) {
          drawLine(x, y, step, step, [0.5], canvas);
        } else if (y < aThirdOfHeight * 2) {
          drawLine(x, y, step, step, [0.2, 0.8], canvas);
        } else {
          drawLine(x, y, step, step, [0.1, 0.5, 0.9], canvas);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

//CirclePackingPainter(300.0)
class CirclePackingPainter extends CustomPainter {
  final double sizeW;
  var circles = [];
  var minRadius = 2.0;
  var maxRadius = 100;
  var totalCircles = 500;
  var createCircleAttempts = 500;

  CirclePackingPainter(this.sizeW);

  createAndDrawCircle(Canvas canvas) {
    Circle newCircle;
    var circleSafeToDraw = false;
    for (var tries = 0; tries < createCircleAttempts; tries++) {
      newCircle = Circle();
      newCircle.x = Random().nextDouble() * sizeW.floor();
      newCircle.y = Random().nextDouble() * sizeW.floor();
      newCircle.radius = minRadius;
      if (doesCircleHaveACollision(newCircle)) {
        continue;
      } else {
        circleSafeToDraw = true;
        break;
      }
    }
    if (!circleSafeToDraw) {
      return;
    }
    for (var radiusSize = minRadius; radiusSize < maxRadius; radiusSize++) {
      newCircle.radius = radiusSize;
      if (doesCircleHaveACollision(newCircle)) {
        newCircle.radius--;
        break;
      }
    }
    circles.add(newCircle);
    canvas.drawCircle(
      Offset(newCircle.x, newCircle.y),
      newCircle.radius,
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  bool doesCircleHaveACollision(Circle circle) {
    for (var i = 0; i < circles.length; i++) {
      var otherCircle = circles[i];
      var a = circle.radius + otherCircle.radius;
      var x = circle.x - otherCircle.x;
      var y = circle.y - otherCircle.y;
      if (a >= sqrt((x * x) + (y * y))) {
        return true;
      }
    }
    if (circle.x + circle.radius >= sizeW || circle.x - circle.radius <= 0) {
      return true;
    }
    if (circle.y + circle.radius >= sizeW || circle.y - circle.radius <= 0) {
      return true;
    }
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < totalCircles; i++) {
      createAndDrawCircle(canvas);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Circle {
  double x;
  double y;
  double radius;
}

//HypnoticSquaresPainter(300.0)
class HypnoticSquaresPainter extends CustomPainter {
  final double sizeW;
  var finalSize = 3;
  var startSteps;
  var offset = 2.0;
  var directions = [-1, 0, 1];

  HypnoticSquaresPainter(this.sizeW);

  drawRect(double x, double y, double width, double height, int xMovement, int yMovement, int steps, Canvas canvas) {
    var tileStep = (sizeW - offset * 2) / 7;
    var startSize = tileStep;
    canvas.drawRect(
      Rect.fromLTWH(x, y, width, height),
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    if (steps >= 0) {
      var newSize = (startSize) * (steps / startSteps) + finalSize;
      var newX = x + (width - newSize) / 2;
      var newY = y + (height - newSize) / 2;
      newX = newX - ((x - newX) / (steps + 2)) * xMovement;
      newY = newY - ((y - newY) / (steps + 2)) * yMovement;
      drawRect(newX, newY, newSize, newSize, xMovement, yMovement, steps - 1, canvas);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    var tileStep = (sizeW - offset * 2) / 7;
    var startSize = tileStep;
    for (var x = offset; x < sizeW - offset; x += tileStep) {
      for (var y = offset; y < sizeW - offset; y += tileStep) {
        startSteps = (2 + Random().nextDouble() * 3).ceil();
        var xDirection = directions[Random().nextInt(3)];
        var yDirection = directions[Random().nextInt(3)];
        drawRect(x, y, startSize, startSize, xDirection, yDirection, startSteps - 1, canvas);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

//PietMondrianPainter(300.0)
class PietMondrianPainter extends CustomPainter {
  final double sizeW;
  var colors = [Colors.red, Colors.blueAccent, Colors.purpleAccent];

  PietMondrianPainter(this.sizeW);

  List<Square> squares;

  splitSquaresWith(double coordinatesX, double coordinatesY) {
    var x = coordinatesX;
    var y = coordinatesY;
    for (var i = squares.length - 1; i >= 0; i--) {
      var square = squares[i];

      if (x != 0 && x > square.x && x < square.x + square.width) {
        if (Random().nextDouble() > 0.5) {
          squares.removeAt(i);
          splitOnX(square, x);
        }
      }

      if (y != 0 && y > square.y && y < square.y + square.height) {
        if (Random().nextDouble() > 0.5) {
          squares.removeAt(i);
          splitOnY(square, y);
        }
      }
    }
  }

  splitOnX(square, splitAt) {
    var squareA = Square(square.x, square.y, square.width - (square.width - splitAt + square.x), square.height);
    var squareB = Square(splitAt, square.y, square.width - splitAt + square.x, square.height);
    squares.add(squareA);
    squares.add(squareB);
  }

  splitOnY(square, splitAt) {
    var squareA = Square(square.x, square.y, square.width, square.height - (square.height - splitAt + square.y));
    var squareB = Square(square.x, splitAt, square.width, square.height - splitAt + square.y);
    squares.add(squareA);
    squares.add(squareB);
  }

  @override
  void paint(Canvas canvas, Size size) {
    squares = [Square(0, 0, sizeW, sizeW)];
    var step = sizeW / 7;
    for (var i = 0.0; i < sizeW; i += step) {
      splitSquaresWith(0.0, i);
      splitSquaresWith(i, 0.0);
    }
    for (var i = 0; i < colors.length; i++) {
      squares[(Random().nextDouble() * squares.length).floor()].color = colors[i];
    }
    for (var i = 0; i < squares.length; i++) {
      Paint paint = Paint();
      if (squares[i].color != null) {
        paint.color = squares[i].color;
        paint.style = PaintingStyle.fill;
      } else {
        paint.color = Colors.grey;
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 4;
      }
      canvas.drawRect(Rect.fromLTWH(squares[i].x, squares[i].y, squares[i].width, squares[i].height), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Square {
  double x;
  double y;
  double width;
  double height;
  Color color;

  Square(this.x, this.y, this.width, this.height, {this.color});
}
