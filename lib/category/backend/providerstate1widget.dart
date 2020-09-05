import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderState1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TestModel(modelValue: 1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ChildWidget1(),
            SizedBox(height: 24),
            ChildWidget2(),
          ],
        ),
      ),
    );
  }
}

var style = TextStyle(color: Colors.white);

class ChildWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('ChildWidget1 build');
    var model = Provider.of<TestModel>(context);
    return Container(
      color: Colors.redAccent,
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('Child1', style: style),
          Text('Model data: ${model.value}', style: style),
          RaisedButton(
            onPressed: () => model.add(),
            child: Text('add'),
          ),
        ],
      ),
    );
  }
}

class ChildWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('ChildWidget2 build');
    var model = Provider.of<TestModel>(context);
    return Container(
      color: Colors.blueAccent,
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('Child2', style: style),
          Text('Model data: ${model.value}', style: style),
          RaisedButton(
            onPressed: () => model.add(),
            child: Text('add'),
          ),
        ],
      ),
    );
  }
}

class TestModel with ChangeNotifier {
  int modelValue;

  int get value => modelValue;

  TestModel({this.modelValue = 0});

  void add() {
    modelValue++;
    notifyListeners();
  }
}
