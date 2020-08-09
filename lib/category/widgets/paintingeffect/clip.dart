import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/item_util.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ClipWidget extends StatefulWidget {
  @override
  _ClipWidgetState createState() => _ClipWidgetState();
}

class _ClipWidgetState extends State<ClipWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('ClipRRect基本使用'),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedItem(100),
        ),
        MainTitleWidget('ClipOval基本使用'),
        ClipOval(
          child: SizedItem(100),
        ),
        MainTitleWidget('ClipPath基本使用'),
        ClipPath(
          clipper: ArcClipper(),
          child: SizedBox(
            width: 320,
            height: 240,
            child: Image.asset('assets/images/flower.jpg'),
          ),
        ),
        ClipPath(
          clipper: StarCliper(radius: 100),
          child: SizedBox(
            width: 320,
            height: 240,
            child: Image.asset('assets/images/flower.jpg'),
          ),
        ),
        ClipPath(
          clipper: BezierClipper(),
          child: SizedBox(
            width: 320,
            height: 240,
            child: Image.asset('assets/images/flower.jpg'),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 300,
            child: Stack(
              children: <Widget>[
                ClipPath(
                  clipper: PathClipper(0),
                  child: Image.asset('assets/images/flower.jpg', fit: BoxFit.cover),
                ),
                ClipPath(
                  clipper: PathClipper(1),
                  child: Image.asset('assets/images/flower.jpg', fit: BoxFit.cover),
                ),
                ClipPath(
                  clipper: PathClipper(2),
                  child: Image.asset('assets/images/flower.jpg', fit: BoxFit.cover),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class StarCliper extends CustomClipper<Path> {
  final double radius;

  StarCliper({this.radius});

  /// 角度转弧度公式
  double degree2Radian(int degree) {
    return (math.pi * degree / 180);
  }

  @override
  Path getClip(Size size) {
    double radius = this.radius;
    Path path = Path();
    double radian = degree2Radian(36); // 36为五角星的角度
    double radiusIn = (radius * math.sin(radian / 2) / math.cos(radian)); // 中间五边形的半径

    path.moveTo((radius * math.cos(radian / 2)), 0.0); // 此点为多边形的起点
    path.lineTo(
        (radius * math.cos(radian / 2) + radiusIn * math.sin(radian)), (radius - radius * math.sin(radian / 2)));
    path.lineTo((radius * math.cos(radian / 2) * 2), (radius - radius * math.sin(radian / 2)));
    path.lineTo(
        (radius * math.cos(radian / 2) + radiusIn * math.cos(radian / 2)), (radius + radiusIn * math.sin(radian / 2)));
    path.lineTo((radius * math.cos(radian / 2) + radius * math.sin(radian)), (radius + radius * math.cos(radian)));
    path.lineTo((radius * math.cos(radian / 2)), (radius + radiusIn));
    path.lineTo((radius * math.cos(radian / 2) - radius * math.sin(radian)), (radius + radius * math.cos(radian)));
    path.lineTo(
        (radius * math.cos(radian / 2) - radiusIn * math.cos(radian / 2)), (radius + radiusIn * math.sin(radian / 2)));
    path.lineTo(0.0, (radius - radius * math.sin(radian / 2)));
    path.lineTo(
        (radius * math.cos(radian / 2) - radiusIn * math.sin(radian)), (radius - radius * math.sin(radian / 2)));

    path.close(); // 使这些点构成封闭的多边形

    return path;
  }

  @override
  bool shouldReclip(StarCliper oldClipper) {
    return this.radius != oldClipper.radius;
  }
}

class BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path1 = Path();
    path1.moveTo(0.0, 0.0);
    path1.quadraticBezierTo(size.width, 0.0, size.width, size.height);
    path1.quadraticBezierTo(0.0, size.height, 0.0, 0.0);
    Path path2 = Path();
    path2.moveTo(size.width, 0.0);
    path2.quadraticBezierTo(0.0, 0.0, 0.0, size.height);
    path2.quadraticBezierTo(size.width, size.height, size.width, 0.0);
    return Path.combine(PathOperation.union, path1, path2);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class PathClipper extends CustomClipper<Path> {
  var type = 0;

  PathClipper(this.type);

  @override
  Path getClip(Size size) {
    Path path = Path();
    switch (type) {
      case 0:
        path.moveTo(0.0, 0.0);
        path.lineTo(0.0, size.height);
        path.lineTo(size.width * 0.2725, size.height);
        path.lineTo(size.width * 0.3725, 0);
        path.close();
        break;
      case 1:
        path.moveTo(size.width * 0.40, 0.0);
        path.lineTo(size.width * 0.3, size.height);
        path.lineTo(size.width * 0.5725, size.height);
        path.lineTo(size.width * 0.6725, 0);
        path.close();
        break;
      default:
        path.moveTo(size.width * 0.7, 0.0);
        path.lineTo(size.width * 0.6, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, 0);
        path.close();
        break;
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
