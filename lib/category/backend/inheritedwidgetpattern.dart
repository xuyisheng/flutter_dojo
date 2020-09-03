import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class InheritedWidgetPattern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModelBinding<CustomModel>(
      initialModel: const CustomModel(),
      child: Column(
        children: [
          MainTitleWidget('InheritedWidget使用的一般范式'),
          AnotherViewController(),
          ViewController(),
        ],
      ),
    );
  }
}

class ViewController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CustomModel model = ModelBinding.of<CustomModel>(context);
    return RaisedButton(
      onPressed: () {
        ModelBinding.update<CustomModel>(context, CustomModel(value: model.value + 1));
      },
      child: Text('Hello World ${model.value}'),
    );
  }
}

class AnotherViewController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Show text ${ModelBinding.of<CustomModel>(context).value}');
  }
}

class CustomModel {
  const CustomModel({this.value = 0});

  final int value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final CustomModel otherModel = other;
    return otherModel.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class _ModelBindingScope<T> extends InheritedWidget {
  const _ModelBindingScope({Key key, this.modelBindingState, Widget child}) : super(key: key, child: child);

  final _ModelBindingState<T> modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class ModelBinding<T> extends StatefulWidget {
  ModelBinding({
    Key key,
    @required this.initialModel,
    this.child,
  })  : assert(initialModel != null),
        super(key: key);

  final T initialModel;
  final Widget child;

  _ModelBindingState<T> createState() => _ModelBindingState<T>();

  static T of<T>(BuildContext context) {
    final _ModelBindingScope<T> scope = context.dependOnInheritedWidgetOfExactType<_ModelBindingScope<T>>();
    return scope.modelBindingState.currentModel;
  }

  static void update<T>(BuildContext context, T newModel) {
    final _ModelBindingScope<T> scope = context.dependOnInheritedWidgetOfExactType<_ModelBindingScope<T>>();
    scope.modelBindingState.updateModel(newModel);
  }
}

class _ModelBindingState<T> extends State<ModelBinding<T>> {
  T currentModel;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  void updateModel(T newModel) {
    if (newModel != currentModel) {
      setState(() => currentModel = newModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ModelBindingScope<T>(
      modelBindingState: this,
      child: widget.child,
    );
  }
}
