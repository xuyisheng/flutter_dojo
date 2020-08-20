import 'package:flutter/material.dart';

class PhysicalShapeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PhysicalShape(
      color: Colors.blueAccent,
      clipper: ShapeBorderClipper(shape: CircleBorder()),
      child: Container(
        height: 150,
        width: 150,
      ),
    );
  }
}
