import 'dart:async';

import 'package:flutter/material.dart';

class BLoCWidget extends StatefulWidget {
  @override
  _BLoCWidgetState createState() => _BLoCWidgetState();
}

class _BLoCWidgetState extends State<BLoCWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<IncrementBloc>(
      bloc: IncrementBloc(),
      child: CounterPage(),
    );
  }
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    BlocProvider<T> provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

abstract class BlocBase {
  void dispose();
}

class IncrementBloc implements BlocBase {
  // _私有化控制访问权限
  int _count;
  StreamController<int> _countController;

  IncrementBloc() {
    _count = 0;
    _countController = StreamController<int>();
  }

  Stream<int> get value => _countController.stream;

  increment() {
    _countController.sink.add(++_count);
  }

  dispose() {
    _countController.close();
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IncrementBloc bloc = BlocProvider.of<IncrementBloc>(context);

    return Scaffold(
      body: Center(
        child: StreamBuilder<int>(
          stream: bloc.value,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text('You hit me: ${snapshot.data} times');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => bloc.increment(),
      ),
    );
  }
}
