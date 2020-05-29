import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ScrollControllerWidget extends StatefulWidget {
  @override
  _ScrollControllerWidgetState createState() => _ScrollControllerWidgetState();
}

class _ScrollControllerWidgetState extends State<ScrollControllerWidget> {
  ScrollController _controller = ScrollController(
    initialScrollOffset: 99,
    keepScrollOffset: true,
  );
  bool toTopBtn = false;
  int count = 50;
  double height = 50;

  @override
  void initState() {
    super.initState();
    _controller.addListener(this.scrollEvent);
  }

  void scrollEvent() {
    print(_controller);
    var _status = false;
    if (_controller.offset > 100) {
      _status = true;
    } else {
      _status = false;
    }
    setState(() {
      this.toTopBtn = _status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MainTitleWidget('ScrollController基本使用'),
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                controller: _controller,
                itemCount: this.count,
                itemExtent: this.height,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(' $index 向上滚动，会显示回到顶部图标'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: !this.toTopBtn
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.cyan,
              child: Icon(
                Icons.arrow_upward,
                color: Colors.blue,
              ),
              onPressed: () {
                _controller.jumpTo(-50);
              },
            ),
    );
  }
}
