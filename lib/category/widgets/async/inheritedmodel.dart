import 'package:flutter/material.dart';

class InheritedModelWidget extends StatefulWidget {
  @override
  _InheritedModelWidgetState createState() => _InheritedModelWidgetState();
}

class _InheritedModelWidgetState extends State<InheritedModelWidget> {
  var inheritedRootModel;

  @override
  void initState() {
    super.initState();
    inheritedRootModel = InheritedRootModel(0);
  }

  add() {
    setState(() {
      inheritedRootModel = InheritedRootModel(inheritedRootModel.count + 1);
    });
  }

  minus() {
    setState(() {
      inheritedRootModel = InheritedRootModel(inheritedRootModel.count - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedRoot(
      inheritedRootModel: inheritedRootModel,
      add: add,
      minus: minus,
      child: Column(
        children: <Widget>[
          Add(),
          Show(),
          Minus(),
        ],
      ),
    );
  }
}

class InheritedRoot extends InheritedWidget {
  final InheritedRootModel inheritedRootModel;

  final Function() add;
  final Function() minus;

  InheritedRoot({
    Key key,
    @required this.inheritedRootModel,
    @required this.add,
    @required this.minus,
    @required Widget child,
  }) : super(key: key, child: child);

  static InheritedRoot of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedRoot>();
  }

  @override
  bool updateShouldNotify(InheritedRoot oldWidget) {
    return inheritedRootModel != oldWidget.inheritedRootModel;
  }
}

class InheritedRootModel {
  final int count;

  const InheritedRootModel(this.count);
}

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final root = InheritedRoot.of(context);
    return Container(
      child: RaisedButton(
        onPressed: root.add,
        child: Text('+'),
      ),
    );
  }
}

class Minus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final root = InheritedRoot.of(context);

    return Container(
      child: RaisedButton(
        onPressed: root.minus,
        child: Text('-'),
      ),
    );
  }
}

class Show extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final root = InheritedRoot.of(context);

    return Container(
      child: Text('Show ${root.inheritedRootModel.count}'),
    );
  }
}
