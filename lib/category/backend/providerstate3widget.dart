import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderState3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TestModel(modelValueA: 1, modelValueB: 1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ChildWidgetA(),
            SizedBox(height: 24),
            ChildWidgetB(),
          ],
        ),
      ),
    );
  }
}

var style = TextStyle(color: Colors.white);

class ChildWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('ChildWidgetA build');
    return Selector<TestModel, int>(
      selector: (context, value) => value.modelValueA,
      builder: (BuildContext context, value, Widget child) {
        return Container(
          color: Colors.redAccent,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('ChildA', style: style),
              Text('Model data: $value', style: style),
              RaisedButton(
                onPressed: () => context.read<TestModel>().addA(),
                child: Text('add'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ChildWidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('ChildWidgetB build');
    return Container(
      color: Colors.blueAccent,
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('ChildB', style: style),
          Builder(
            builder: (BuildContext context) {
              return Text(
                'Model data: ${context.select((TestModel value) => value.modelValueB)}',
                style: style,
              );
            },
          ),
          RaisedButton(
            onPressed: () => context.read<TestModel>().addB(),
            child: Text('add'),
          ),
        ],
      ),
    );
  }
}

class TestModel with ChangeNotifier {
  int modelValueA;
  int modelValueB;

  int get valueA => modelValueA;

  int get valueB => modelValueB;

  TestModel({this.modelValueA = 0, this.modelValueB = 0});

  void addA() {
    modelValueA++;
    notifyListeners();
  }

  void addB() {
    modelValueB++;
    notifyListeners();
  }
}
