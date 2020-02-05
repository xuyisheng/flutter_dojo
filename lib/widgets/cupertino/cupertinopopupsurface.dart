import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CupertinoPopupSurfaceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('CupertinoPopupSurface基本使用'),
        Container(
          width: 300,
          height: 300,
          child: CupertinoPopupSurface(
            isSurfacePainted: false,
            child: Container(
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text(
                'CupertinoPopupSurface',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
