import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderState2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TestModel(modelValue: 1),
      child: NewWidget(),
    );
  }
}

class NewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.redAccent,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Child1', style: style),
              Consumer<TestModel>(
                builder: (BuildContext context, value, Widget child) {
                  return Text(
                    'Model data: ${value.value}',
                    style: style,
                  );
                },
              ),
              RaisedButton(
                onPressed: () => Provider.of<TestModel>(context, listen: false).add(),
                child: Text('add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

var style = TextStyle(color: Colors.white);

class TestModel with ChangeNotifier {
  int modelValue;

  int get value => modelValue;

  TestModel({this.modelValue = 0});

  void add() {
    modelValue++;
    notifyListeners();
  }
}
