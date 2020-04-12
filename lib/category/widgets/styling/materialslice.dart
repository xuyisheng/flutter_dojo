import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class MaterialSliceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MergeableMaterial(
          hasDividers: true,
          children: [
            MaterialSlice(
              key: ValueKey<int>(0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  MainTitleWidget('MergeableMaterial中使用MaterialSlice'),
                  Container(
                    height: 100,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 100,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
