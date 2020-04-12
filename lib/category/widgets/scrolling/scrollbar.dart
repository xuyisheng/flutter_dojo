import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ScrollbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Scrollbar基本使用'),
        Expanded(
          child: Scrollbar(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
