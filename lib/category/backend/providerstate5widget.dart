import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderState5Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TestModel(modelValue: 1),
      child: Navigator(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case 'page1':
              return MaterialPageRoute(builder: (context) => PageOne());
            case 'page2':
              return MaterialPageRoute(builder: (context) => PageTwo());
            default:
              return MaterialPageRoute(builder: (context) => PageOne());
          }
        },
        initialRoute: 'page1',
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Goto page 2, data= ${Provider.of<TestModel>(context).modelValue}'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => PageTwo()));
          },
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('data= ${Provider.of<TestModel>(context).modelValue}'),
            RaisedButton(
              onPressed: () {
                Provider.of<TestModel>(context, listen: false).add();
              },
              child: Text('add'),
            ),
            RaisedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('back'),
            )
          ],
        ),
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
