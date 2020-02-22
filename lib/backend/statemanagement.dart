import 'package:flutter/material.dart';

class StateManagementWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: const DataModel(),
      child: Container(child: ViewController()),
    );
  }
}

class ViewController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        final DataModel model = DataModel.of(context);
        DataModel.update(context, DataModel(value: model.value + 1));
      },
      child: Text('Hello World ${DataModel.of(context).value}'),
    );
  }
}

class ModelBinding extends StatefulWidget {
  ModelBinding({
    Key key,
    this.initialModel = const DataModel(),
    this.child,
  })  : assert(initialModel != null),
        super(key: key);

  final DataModel initialModel;
  final Widget child;

  _ModelBindingState createState() => _ModelBindingState();
}

class _ModelBindingState extends State<ModelBinding> {
  DataModel currentModel;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  void updateModel(DataModel newModel) {
    if (newModel != currentModel) {
      setState(() => currentModel = newModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ModelBindingScope(
      modelBindingState: this,
      child: widget.child,
    );
  }
}

class _ModelBindingScope extends InheritedWidget {
  _ModelBindingScope({
    Key key,
    @required this.modelBindingState,
    Widget child,
  })  : assert(modelBindingState != null),
        super(key: key, child: child);

  final _ModelBindingState modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class DataModel {
  const DataModel({this.value = 0});

  final int value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final DataModel otherModel = other;
    return otherModel.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  static DataModel of(BuildContext context) {
    final _ModelBindingScope scope = context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    return scope.modelBindingState.currentModel;
  }

  static void update(BuildContext context, DataModel newModel) {
    final _ModelBindingScope scope = context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    scope.modelBindingState.updateModel(newModel);
  }
}
