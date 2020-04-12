import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LifeCycleWidget extends StatefulWidget {
  @override
  _LifeCycleWidgetState createState() => _LifeCycleWidgetState();
}

class _LifeCycleWidgetState extends State<LifeCycleWidget> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Container();
  }

  @override
  void initState() {
    super.initState();
    debugPrint('initState');
    SchedulerBinding.instance.addPostFrameCallback((_) => {debugPrint('addPostFrameCallback')});
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('didChangeDependencies');
  }

  @override
  void didUpdateWidget(LifeCycleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('didUpdateWidget');
  }

  @override
  void reassemble() {
    super.reassemble();
    debugPrint('reassemble');
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint('deactivate');
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    debugPrint('dispose');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint(state.toString());
  }
}
