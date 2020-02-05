import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/widgets/input/form.dart';
import 'package:flutter_dojo/widgets/input/rawkeyboardlistener.dart';

List<DemoItem> buildInputDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.input,
      title: 'Form',
      subtitle: 'An optional container for grouping together multiple form field widgets (e.g. TextField widgets).',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Form-class.html',
      buildRoute: (context) => BaseWidget('Form', codePath, FormWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'FormField',
      subtitle:
          'A single form field. This widget maintains the current state of the form field, so that updates and validation errors are visually reflected in the UI.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/FormField-class.html',
      buildRoute: (context) => BaseWidget('FormField', codePath, FormWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'RawKeyboardListener',
      subtitle: 'A widget that calls a callback whenever the user presses or releases a key on a keyboard.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/RawKeyboardListener-class.html',
      buildRoute: (context) => BaseWidget('RawKeyboardListener', codePath, RawKeyboardListenerWidget()),
    )
  ];
}
