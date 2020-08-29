import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class InheritedWidgetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RootContainer(
      child: Column(
        children: <Widget>[
          Widget1(),
          Widget2(),
          Widget3(),
        ],
      ),
    );
  }
}

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('build Widget1');
    return SubtitleWidget('InheritedWidget本身不具有写数据的功能，需要结合State来获取数据修改的能力');
  }
}

class Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('build Widget2');
    return Text(
      'show ${RootContainer.of(context).count}',
      style: TextStyle(fontSize: 20),
    );
  }
}

class Widget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('build Widget3');
    return RaisedButton(
      onPressed: () {
        RootContainer.ofNoBuild(context).incrementCounter();
      },
      child: Text('Add'),
    );
  }
}

class RootContainer extends StatefulWidget {
  final Widget child;

  RootContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  _RootContainerState createState() => _RootContainerState();

  static _RootContainerState of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<Root>().state;

  static _RootContainerState ofNoBuild(BuildContext context) => context.findAncestorWidgetOfExactType<Root>().state;
}

class _RootContainerState extends State<RootContainer> {
  int count = 0;

  void incrementCounter() => setState(() => count++);

  @override
  Widget build(BuildContext context) {
    return Root(state: this, child: widget.child);
  }
}

// 同时支持读取和写入
class Root extends InheritedWidget {
  final _RootContainerState state;

  Root({
    Key key,
    @required this.state,
    @required Widget child,
  }) : super(key: key, child: child);

  // 判断是否需要更新
  @override
  bool updateShouldNotify(Root oldWidget) => true;
}

class InheritedWidgetReadOnlyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReadOnlyRoot(
      count: 1008,
      child: ChildReadOnly(),
    );
  }
}

class ChildReadOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    ReadOnlyRoot root = ReadOnlyRoot.of(context);
    return Column(
      children: <Widget>[
        SubtitleWidget('InheritedWidget本身不具有写数据的功能，需要结合State来获取数据修改的能力'),
        Text(
          'show ${root.count}',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
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
