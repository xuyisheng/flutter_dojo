import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWidget extends StatelessWidget {
  final textSize = 30;
  final counterModel = CounterModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: CounterModel(),
      child: FirstPage(),
    );
  }
}

class CounterModel with ChangeNotifier {
  int _countNum = 0;

  int get countNum => _countNum;

  void increment() {
    _countNum++;
    notifyListeners();
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Show ${_counter._countNum}'),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider.value(
                    value: _counter,
                    child: SecondPage(),
                  ),
                ),
              );
            },
            child: Text('Goto SecondPage'),
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<CounterModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () => counter.increment(),
            child: Text('Add'),
          ),
        ),
      ),
    );
  }
}
