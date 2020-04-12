import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Model1(modelValue: 1),
      child: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: ChildWidget1(),
        ),
        Flexible(
          flex: 1,
          child: ChildWidget2(),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }
}

var style = TextStyle(color: Colors.white);

class ChildWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Model1>(context);

    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Child1', style: style),
          Text('Modle data: ${model.value}', style: style),
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
    var model = Provider.of<Model1>(context);

    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Child2', style: style),
          Text('Modle data: ${model.value}', style: style),
          RaisedButton(
            onPressed: () => model.add(),
            child: Text('add'),
          ),
        ],
      ),
    );
  }
}

class Model1 with ChangeNotifier {
  int modelValue;

  int get value => modelValue;

  Model1({this.modelValue = 0});

  void add() {
    modelValue++;
    notifyListeners();
  }
}
