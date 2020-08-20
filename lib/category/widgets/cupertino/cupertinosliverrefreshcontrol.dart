import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSliverRefreshControlWidget extends StatefulWidget {
  @override
  _CupertinoSliverRefreshControlWidgetState createState() => _CupertinoSliverRefreshControlWidgetState();
}

class _CupertinoSliverRefreshControlWidgetState extends State<CupertinoSliverRefreshControlWidget> {
  var _list = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            setState(() {
              _list.add(_list.length + 1);
            });
          },
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((content, index) {
            return ListTile(
              title: Text('Item${_list[index]}'),
            );
          }, childCount: _list.length),
        ),
      ],
    );
  }
}
