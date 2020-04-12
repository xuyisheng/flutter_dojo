import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class RatingWidget extends StatelessWidget {
  List<Widget> generateStar(double score, int total) {
    List<Widget> list = List<Widget>();
    for (var i = 0; i < total; i++) {
      double factor = (score - i);
      if (factor >= 1) {
        factor = 1.0;
      } else if (factor < 0) {
        factor = 0;
      }
      Stack stack = Stack(
        children: <Widget>[
          Icon(
            Icons.star,
            color: Colors.grey,
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.topLeft,
              widthFactor: factor,
              child: Icon(
                Icons.star,
                color: Colors.red,
              ),
            ),
          ),
        ],
      );
      list.add(stack);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('通过Clip实现'),
        Row(children: generateStar(3.5, 5)),
      ],
    );
  }
}
