import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class AnimatedListWidget extends StatefulWidget {
  @override
  _AnimatedListWidgetState createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {
  List<String> list = ['0', '1', '2', '3'];
  GlobalKey<AnimatedListState> listKey = GlobalKey();
  int item = 0;

  _addItem() {
    setState(() {
      listKey.currentState.insertItem(
        list.length,
        duration: const Duration(
          milliseconds: 2000,
        ),
      );
      int id = Random().nextInt(100);
      list.add('New Item $id');
    });
  }

  _removeItem() {
    setState(() {
      int id = 0;
      listKey.currentState.removeItem(
        id,
        (context, animation) {
          if (item == 0) {
            return _buildItem(context, 0, animation);
          } else if (item == 1) {
            return _buildItem1(context, 0, animation);
          } else if (item == 2) {
            return _buildItem2(context, 0, animation);
          } else {
            return _buildItem2(context, 0, animation);
          }
        },
        duration: const Duration(milliseconds: 2000),
      );
      list.removeAt(id);
    });
  }

  Widget _buildItem(BuildContext context, int index, Animation<double> animation) {
    return SizeTransition(
      key: ValueKey<int>(index),
      axis: Axis.vertical,
      sizeFactor: animation,
      child: ListTile(
        title: Text(list[index]),
      ),
    );
  }

  Widget _buildItem1(BuildContext context, int index, Animation<double> animation) {
    return SlideTransition(
      position: animation.drive(CurveTween(curve: Curves.easeIn)).drive(Tween<Offset>(begin: Offset(1, 1), end: Offset(0, 1))),
      key: ValueKey<int>(index),
      child: ListTile(
        title: Text(list[index]),
      ),
    );
  }

  Widget _buildItem2(BuildContext context, int index, Animation<double> animation) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Interval(0.5, 1.0)),
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animation, curve: Interval(0.0, 1.0)),
        axisAlignment: 0.0,
        child: ListTile(
          title: Text(list[index]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('AnimatedList基本使用'),
        Expanded(
          child: AnimatedList(
            key: listKey,
            itemBuilder: (context, index, animation) {
              if (item == 0) {
                return _buildItem(context, index, animation);
              } else if (item == 1) {
                return _buildItem1(context, index, animation);
              } else if (item == 2) {
                return _buildItem2(context, index, animation);
              } else {
                return _buildItem2(context, index, animation);
              }
            },
            initialItemCount: list.length,
          ),
        ),
        MultiSelectionWidget(
          'Anim type',
          [0, 1, 2],
          ['Type1', 'Type2', 'Type3'],
          (v) {
            setState(() => item = v);
          },
        ),
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() => _addItem());
              },
              child: Text('Add new item'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() => _removeItem());
              },
              child: Text('Remove first item'),
            ),
          ],
        )
      ],
    );
  }
}
