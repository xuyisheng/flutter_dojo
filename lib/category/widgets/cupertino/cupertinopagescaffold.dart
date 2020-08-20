import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class CupertinoPageScaffoldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('PageScaffold基本使用'),
        SubtitleWidget('CupertinoNavigationBarBackButton: A nav bar back button typically used in [CupertinoNavigationBar].'),
        Expanded(
          child: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: Colors.grey,
              leading: CupertinoNavigationBarBackButton(),
              middle: const Text('PageScaffold'),
            ),
            child: Center(
              child: Text('Hello World!'),
            ),
          ),
        ),
      ],
    );
  }
}
