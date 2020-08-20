import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverLayoutBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverLayoutBuilder(
          builder: (BuildContext context, SliverConstraints constraints) {
            print('${constraints.userScrollDirection}');
            var color = Colors.red;
            if (constraints.userScrollDirection == ScrollDirection.forward) {
              color = Colors.blue;
            }
            return SliverToBoxAdapter(
                child: Container(
              height: 1000,
              color: color,
            ));
          },
        ),
      ],
    );
  }
}
