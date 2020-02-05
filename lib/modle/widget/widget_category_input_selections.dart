import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/widgets/inputselections/checkbox.dart';
import 'package:flutter_dojo/widgets/inputselections/checkboxlisttile.dart';
import 'package:flutter_dojo/widgets/inputselections/daypicker.dart';
import 'package:flutter_dojo/widgets/inputselections/radio.dart';
import 'package:flutter_dojo/widgets/inputselections/radiolisttile.dart';
import 'package:flutter_dojo/widgets/inputselections/slider.dart';
import 'package:flutter_dojo/widgets/inputselections/slidertheme.dart';
import 'package:flutter_dojo/widgets/inputselections/switch.dart';
import 'package:flutter_dojo/widgets/inputselections/switchlisttile.dart';
import 'package:flutter_dojo/widgets/inputselections/textfield.dart';
import 'package:flutter_dojo/widgets/inputselections/textformfield.dart';

List<DemoItem> buildInputSelectionsDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.input,
      title: 'Checkbox',
      subtitle: 'A horizontal arrangement of buttons.',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Checkbox-class.html',
      buildRoute: (context) => BaseWidget('Checkbox', codePath, CheckBoxWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'CheckboxListTile',
      subtitle: 'CheckboxListTile',
      documentationUrl: 'https://docs.flutter.io/flutter/material/CheckboxListTile-class.html',
      buildRoute: (context) => BaseWidget('Checkbox', codePath, CheckBoxListTileWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'DayPicker',
      subtitle:
          'Date pickers use a dialog window to select a single date on mobile. Time pickers use a dialog to select a single time (in the hours:minutes format) on mobile.',
      documentationUrl: 'https://api.flutter.dev/flutter/material/showDatePicker.html',
      buildRoute: (context) => BaseWidget('DayPicker', codePath, DayPickerWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'Radio',
      subtitle:
          'Radio buttons allow the user to select one option from a set. Use radio buttons for exclusive selection if you think that the user needs to see all available options side-by-side.',
      documentationUrl: 'https://api.flutter.dev/flutter/material/Radio-class.html',
      buildRoute: (context) => BaseWidget('Radio', codePath, RadioWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'RadioListTile',
      subtitle: 'RadioListTile',
      documentationUrl: 'https://api.flutter.dev/flutter/material/RadioListTile-class.html',
      buildRoute: (context) => BaseWidget('Radio', codePath, RadioListTileWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'Slider',
      subtitle: 'Sliders let users select from a range of values by moving the slider thumb.',
      documentationUrl: 'https://api.flutter.dev/flutter/material/Slider-class.html',
      buildRoute: (context) => BaseWidget('Slider', codePath, SliderWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'SliderTheme',
      subtitle: 'SliderTheme',
      documentationUrl: 'https://api.flutter.dev/flutter/material/SliderTheme-class.html',
      buildRoute: (context) => BaseWidget('SliderTheme', codePath, SliderThemeWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'Switch',
      subtitle:
          'On/off switches toggle the state of a single settings option. The Switch widget implements this component.',
      documentationUrl: 'https://api.flutter.dev/flutter/material/Switch-class.html',
      buildRoute: (context) => BaseWidget('Switch', codePath, SwitchWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'SwitchListTile',
      subtitle: 'SwitchListTile',
      documentationUrl: 'https://api.flutter.dev/flutter/material/SwitchListTile-class.html',
      buildRoute: (context) => BaseWidget('SwitchListTile', codePath, SwitchListTileWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'TextField',
      subtitle:
          'Touching a text field places the cursor and displays the keyboard. The TextField widget implements this component.',
      documentationUrl: 'https://docs.flutter.io/flutter/material/TextField-class.html',
      buildRoute: (context) => BaseWidget('TextField', codePath, TextFieldWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'TextFormField',
      subtitle: 'TextFormField',
      documentationUrl: 'https://docs.flutter.io/flutter/material/TextFormField-class.html',
      buildRoute: (context) => BaseWidget('TextFormField', codePath, TextFormFieldWidget()),
    )
  ];
}
