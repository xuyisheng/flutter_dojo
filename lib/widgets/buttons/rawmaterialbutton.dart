import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class RawMaterialButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('RawMaterialButton基本使用'),
        RawMaterialButton(
          onPressed: () {},
          child: Text('RawMaterialButton'),
        ),
        MainTitleWidget('RawMaterialButton In ButtonBar'),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {},
              child: Text('RawMaterialButton'),
            ),
            RawMaterialButton(
              onPressed: null,
              child: Text('RawMaterialButton Disabled'),
            ),
          ],
        ),
      ],
    );
  }
}
