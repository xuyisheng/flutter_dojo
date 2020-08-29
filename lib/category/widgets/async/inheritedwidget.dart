import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class InheritedWidgetWidget extends StatefulWidget {
  @override
  _InheritedWidgetWidgetState createState() => _InheritedWidgetWidgetState();
}

class _InheritedWidgetWidgetState extends State<InheritedWidgetWidget> {
  int count = 0;

  void incrementCounter() => setState(() => count++);

  @override
  Widget build(BuildContext context) {
    return Root(
      state: this,
      child: Child(),
    );
  }
}

class Child extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    Root root = Root.of(context);
    return Column(
      children: <Widget>[
        SubtitleWidget('InheritedWidget本身不具有写数据的功能，需要结合State来获取数据修改的能力'),
        Text(
          'show ${root.state.count}',
          style: TextStyle(fontSize: 20),
        ),
        RaisedButton(
          onPressed: () {
            root.state.incrementCounter();
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

// 同时支持读取和写入
class Root extends InheritedWidget {
  static Root of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<Root>();

  final _InheritedWidgetWidgetState state;

  Root({
    Key key,
    @required this.state,
    @required Widget child,
  }) : super(key: key, child: child);

  // 判断是否需要更新
  @override
  bool updateShouldNotify(Root oldWidget) => state.count != oldWidget.state.count;
}

// 仅支持读取属性
class ReadOnlyRoot extends InheritedWidget {
  static ReadOnlyRoot of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<ReadOnlyRoot>();

  final int count;

  ReadOnlyRoot({
    Key key,
    @required this.count,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(ReadOnlyRoot oldWidget) => count != oldWidget.count;
}
