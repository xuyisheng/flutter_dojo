import 'package:flutter/material.dart';

class AvatarListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
        )
      ],
    );
  }
}
