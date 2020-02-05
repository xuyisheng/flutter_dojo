import 'package:flutter/material.dart';

class BubbleWidget extends StatelessWidget {
  _bubbleBody() {
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
    return _bubbleBody();
  }
}
