import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class AvatarListWidget extends StatelessWidget {
  final double sizeW = 50;
  final double offsetW = 40;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Avatar错列'),
        Container(
          color: Colors.red,
          child: Transform.translate(
            offset: Offset(30, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 32,
                  child: Text('A'),
                ),
                Transform.translate(
                  offset: Offset(-20, 0),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.yellow,
                    child: Text('A'),
                  ),
                ),
                Transform.translate(
                  offset: Offset(-40, 0),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.deepPurpleAccent,
                    child: Text('A'),
                  ),
                ),
                Transform.translate(
                  offset: Offset(-60, 0),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.green,
                    child: Text('A'),
                  ),
                ),
              ],
            ),
          ),
        ),
        MainTitleWidget('通过Stack实现Avatar错列'),
        Container(
          alignment: Alignment.topRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: _getImageStackWidth(6),
                height: sizeW,
                child: Stack(
                  children: _getStackItems(6),
                ),
              ),
            ],
          ),
        ),
        MainTitleWidget('通过Shape实现Avatar'),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/flower.jpg'),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  double _getImageStackWidth(int imageNumber) {
    return offsetW * (imageNumber - 1) + sizeW;
  }

  List<Widget> _getStackItems(int count) {
    List<Widget> _list = new List<Widget>();
    for (var i = 0; i < count; i++) {
      double off = offsetW * i;
      _list.add(
        Positioned(
          left: off,
          child: Container(
            width: sizeW,
            height: sizeW,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/flower.jpg'),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    }
    return _list;
  }
}
