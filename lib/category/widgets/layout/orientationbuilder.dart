import 'package:flutter/material.dart';

class OrientationBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        int count = orientation == Orientation.portrait ? 3 : 5;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count,
            crossAxisSpacing: 2,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (context, index) {
            return Container(color: Colors.primaries[index % Colors.primaries.length]);
          },
          itemCount: 30,
        );
      },
    );
  }
}
