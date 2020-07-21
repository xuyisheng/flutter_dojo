import 'dart:math';

import 'package:flutter/material.dart';

class ScrollToPositionWidget extends StatefulWidget {
  @override
  _ScrollToPositionWidgetState createState() => _ScrollToPositionWidgetState();
}

class _ScrollToPositionWidgetState extends State<ScrollToPositionWidget> {
  GlobalKey scrollKey = GlobalKey();

  ScrollController controller = ScrollController();

  List<ItemModel> dataList = List();

  @override
  void initState() {
    dataList.clear();
    for (int i = 0; i < 30; i++) {
      dataList.add(ItemModel(i));
    }
    super.initState();
  }

  _scrollToPosition(int index) {
    var key = dataList[index];
    RenderBox renderBox = key.globalKey.currentContext.findRenderObject();
    double dy = renderBox.localToGlobal(Offset.zero, ancestor: scrollKey.currentContext.findRenderObject()).dy;
    var offset = dy + controller.offset;
    controller.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            key: scrollKey,
            controller: controller,
            child: Column(
              children: dataList.map<Widget>((data) {
                return ItemLayout(data, key: dataList[data.index].globalKey);
              }).toList(),
            ),
          ),
        ),
        RaisedButton(
          onPressed: () => _scrollToPosition(10),
          child: Text('scroll to 10'),
        ),
      ],
    );
  }
}

class ItemLayout extends StatelessWidget {
  final random = Random();

  final ItemModel data;

  ItemLayout(this.data, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ((400 * random.nextDouble()).clamp(100.0, 400.0)),
      child: Container(
        margin: EdgeInsets.all(16),
        color: Colors.blueAccent,
        child: Center(child: Text(data.index.toString())),
      ),
    );
  }
}

class ItemModel {
  GlobalKey globalKey = GlobalKey();
  final int index;

  ItemModel(this.index);
}
