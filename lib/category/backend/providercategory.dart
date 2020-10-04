import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:provider/provider.dart';

class ProviderCategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('Providers使用分类'),
        createItem(context, 'Provider', CatalogProvider()),
        createItem(context, 'ChangeNotifierProvider', CatalogChangeNotifierProvider()),
        createItem(context, 'Consumer', CatalogConsumer()),
        createItem(context, 'ListenableProvider', CatalogListenableProvider()),
        createItem(context, 'ValueListenableProvider', CatalogValueListenableProvider()),
        createItem(context, 'StreamProvider', CatalogStreamProvider()),
        createItem(context, 'FutureProvider', CatalogFutureProvider()),
        createItem(context, 'ProxyProvider', CatalogProxyProvider()),
        createItem(context, 'Selector', CatalogSelector()),
        createItem(context, 'Select', CatalogSelect()),
      ],
    );
  }

  createItem(BuildContext context, String name, Widget routePage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => routePage));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}

class CatalogProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Provider管理了一个恒定的数据 ${Provider.of<int>(context).toInt()}'),
      ),
    );
  }
}

class CatalogChangeNotifierProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ChangeNotifierProvider管理了一个可变化的数据，可以在数据变化的时候通知观察者，但是会导致整个页面rebuild \n${Provider.of<ChangeNotifyModel>(context).value}',
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: Center(
                        child: RaisedButton(
                          onPressed: () => Provider.of<ChangeNotifyModel>(context, listen: false).increment(),
                          child: Text('add'),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Text('Goto another page'),
            ),
          ],
        ),
      ),
    );
  }
}

class CatalogConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<ChangeNotifyModel>(
              builder: (context, model, child) {
                return Text(
                  'Consumer管理了一个可变化的数据，可以在数据变化的时候通知观察者，同时可以缩小页面刷新的范围 \n${model.value}',
                  textAlign: TextAlign.center,
                );
              },
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Consumer<ChangeNotifyModel>(
                      builder: (context, model, child) {
                        return Scaffold(
                          body: Center(
                            child: RaisedButton(
                              onPressed: () => model.increment(),
                              child: Text('add'),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              child: Text('Goto another page'),
            ),
          ],
        ),
      ),
    );
  }
}

class CatalogListenableProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ListenableProvider管理了一个可变化的数据，可以在数据变化的时候通知观察者，但是会导致整个页面rebuild，它与ChangeNotifierProvider的区别是，ListenableProvider不会手动调用dispose \n${Provider.of<ChangeNotifyModel>(context).value}',
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: Center(
                        child: RaisedButton(
                          onPressed: () => Provider.of<ChangeNotifyModel>(context, listen: false).increment(),
                          child: Text('add'),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Text('Goto another page'),
            ),
          ],
        ),
      ),
    );
  }
}

class CatalogValueListenableProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ValueListenableProvider返回的对象必须是ValueNotifier<T>的子类，ValueNotifier是我们前面多次提到的ChangeNotifier的子类，在改变value时，自动调用了notifyListeners \n${Provider.of<ValueNotifyModel>(context).value}',
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: Center(
                        child: RaisedButton(
                          onPressed: () {
                            ValueNotifyModel oldModel = Provider.of<ValueNotifyModel>(context, listen: false);
                            ValueNotifyModel newModel = ValueNotifyModel(oldModel.value + 1);
                            newModel.wrapper = oldModel.wrapper;
                            oldModel.wrapper.value = newModel;
                          },
                          child: Text('add'),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Text('Goto another page'),
            ),
          ],
        ),
      ),
    );
  }
}

class CatalogStreamProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'StreamProvider与Stream配合使用 \n${Provider.of<int>(context)}',
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: Center(
                        child: RaisedButton(
                          onPressed: () => ProviderStream().increment(),
                          child: Text('add'),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Text('Goto another page'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProviderStream {
  static ProviderStream _instance;

  ProviderStream._internal();

  static ProviderStream _getInstance() {
    if (_instance == null) {
      _instance = ProviderStream._internal();
    }
    return _instance;
  }

  factory ProviderStream() => _getInstance();

  static ProviderStream get instance => _getInstance();

  int _count = 0;
  var _countController = StreamController<int>.broadcast();

  Stream<int> get stream => _countController.stream;

  int get count => _count;

  increment() {
    _countController.sink.add(++_count);
  }

  dispose() {
    _countController.close();
  }
}

class CatalogFutureProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'FutureProvider与Future配合使用 \n${Provider.of<String>(context)}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> providerFuture() async {
  return await Future<String>.delayed(Duration(milliseconds: 2000)).then((String value) => 'xuyisheng');
}

class CatalogSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selector可以控制更加精细的刷新粒度，当一个model中的不同属性变化时，可以根据需要单独刷新',
              textAlign: TextAlign.center,
            ),
            CatalogSelectorItem1(),
            CatalogSelectorItem2(),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () => Provider.of<SelectorModel>(context, listen: false).increment1(),
                              child: Text('add value 1'),
                            ),
                            RaisedButton(
                              onPressed: () => Provider.of<SelectorModel>(context, listen: false).increment2(),
                              child: Text('add value 2'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Text('Goto another page'),
            ),
          ],
        ),
      ),
    );
  }
}

class CatalogSelectorItem1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build item 1');
    return Selector<SelectorModel, int>(
      builder: (context, value, child) => Text('value1: $value'),
      selector: (context, value) => value.value1,
    );
  }
}

class CatalogSelectorItem2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build item 2');
    return Selector<SelectorModel, int>(
      builder: (context, value, child) => Text('value2: $value'),
      selector: (context, value) => value.value2,
    );
  }
}

class CatalogSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selector可以控制更加精细的刷新粒度，当一个model中的不同属性变化时，可以根据需要单独刷新',
              textAlign: TextAlign.center,
            ),
            CatalogSelectItem1(),
            CatalogSelectItem2(),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () => Provider.of<SelectorModel>(context, listen: false).increment1(),
                              child: Text('add value 1'),
                            ),
                            RaisedButton(
                              onPressed: () => Provider.of<SelectorModel>(context, listen: false).increment2(),
                              child: Text('add value 2'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Text('Goto another page'),
            ),
          ],
        ),
      ),
    );
  }
}

class CatalogSelectItem1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build item 1');
    return Text('value1: ${context.select((SelectorModel value) => value.value1)}');
  }
}

class CatalogSelectItem2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build item 2');
    return Text('value2: ${context.select((SelectorModel value) => value.value2)}');
  }
}

class ChangeNotifyModel extends ChangeNotifier {
  int _count = 0;

  int get value => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class ValueNotifyModel {
  int _count = 0;

  int get value => _count;

  ValueNotifyModel(this._count);

  ValueNotifyModelWrapper wrapper;
}

class ValueNotifyModelWrapper extends ValueNotifier<ValueNotifyModel> {
  ValueNotifyModelWrapper(ValueNotifyModel value) : super(value) {
    value.wrapper = this;
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class SelectorModel extends ChangeNotifier {
  int _count1 = 0;

  int get value1 => _count1;

  void increment1() {
    _count1++;
    notifyListeners();
  }

  int _count2 = 0;

  int get value2 => _count2;

  void increment2() {
    _count2++;
    notifyListeners();
  }
}

class CatalogProxyProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<PicModel>(create: (context) => PicModel()),
            ProxyProvider<PicModel, SubmitModel>(update: (context, myModel, anotherModel) => SubmitModel(myModel)),
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '如果要提供两个Model，其中一个Model取决于另一个Model，在这种情况下，可以使用ProxyProvider。'
                'ProxyProvider可以从一个Provider获取值，然后将其注入另一个Provider',
                textAlign: TextAlign.center,
              ),
              Builder(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('获取图片地址：${Provider.of<PicModel>(context).imageUrl}'),
                  );
                },
              ),
              Consumer<SubmitModel>(
                builder: (context, model, child) {
                  return RaisedButton(
                    onPressed: model.submit,
                    child: Text("submit image"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PicModel with ChangeNotifier {
  String imageUrl = '';

  Future upLoadPic() async {
    await Future.delayed(Duration(seconds: 2));
    imageUrl = 'https://cos........';
    notifyListeners();
  }
}

class SubmitModel {
  PicModel _model;

  SubmitModel(this._model);

  submit() async {
    await _model.upLoadPic();
  }
}
