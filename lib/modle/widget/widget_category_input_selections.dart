import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/widgets/inputselections/checkbox.dart';
import 'package:flutter_dojo/category/widgets/inputselections/checkboxlisttile.dart';
import 'package:flutter_dojo/category/widgets/inputselections/daypicker.dart';
import 'package:flutter_dojo/category/widgets/inputselections/radio.dart';
import 'package:flutter_dojo/category/widgets/inputselections/radiolisttile.dart';
import 'package:flutter_dojo/category/widgets/inputselections/slider.dart';
import 'package:flutter_dojo/category/widgets/inputselections/slidertheme.dart';
import 'package:flutter_dojo/category/widgets/inputselections/switch.dart';
import 'package:flutter_dojo/category/widgets/inputselections/switchlisttile.dart';
import 'package:flutter_dojo/category/widgets/inputselections/textfield.dart';
import 'package:flutter_dojo/category/widgets/inputselections/textformfield.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItem> buildInputSelectionsDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.input,
      title: 'Checkbox',
      subtitle: 'A material design checkbox.',
      keyword: 'Checkbox',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/Checkbox-class.html',
      buildRoute: (context) => BaseWidget('Checkbox', codePath + 'checkbox', CheckBoxWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'CheckboxListTile',
      subtitle: 'A [ListTile] with a [Checkbox]. In other words, a checkbox with a label.',
      keyword: 'CheckboxListTile',
      documentationUrl: 'https://docs.flutter.io/flutter/material/CheckboxListTile-class.html',
      buildRoute: (context) => BaseWidget('Checkbox', codePath + 'checkbox', CheckBoxListTileWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'DayPicker',
      subtitle:
          'Date pickers use a dialog window to select a single date on mobile. Time pickers use a dialog to select a single time (in the hours:minutes format) on mobile.',
      keyword: 'DayPicker CalendarDatePicker',
      documentationUrl: 'https://api.flutter.dev/flutter/material/showDatePicker.html',
      buildRoute: (context) => BaseWidget('DayPicker', codePath + 'daypicker', DayPickerWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'Radio',
      subtitle:
          'Radio buttons allow the user to select one option from a set. Use radio buttons for exclusive selection if you think that the user needs to see all available options side-by-side.',
      keyword: 'Radio',
      documentationUrl: 'https://api.flutter.dev/flutter/material/Radio-class.html',
      buildRoute: (context) => BaseWidget('Radio', codePath + 'radio', RadioWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'RadioListTile',
      subtitle: 'A [ListTile] with a [Radio]. In other words, a radio button with a label.',
      keyword: 'RadioListTile',
      documentationUrl: 'https://api.flutter.dev/flutter/material/RadioListTile-class.html',
      buildRoute: (context) => BaseWidget('RadioListTile', codePath + 'radiolisttile', RadioListTileWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'Slider',
      subtitle: 'Sliders let users select from a range of values by moving the slider thumb.',
      keyword: 'Slider',
      documentationUrl: 'https://api.flutter.dev/flutter/material/Slider-class.html',
      buildRoute: (context) => BaseWidget('Slider', codePath + 'slider', SliderWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'SliderTheme',
      subtitle:
          '''{@template flutter.material.slider.seeAlso.sliderComponentShape}  * [SliderComponentShape], which can be used to create custom shapes for    the [Slider]'s thumb, overlay, and value indicator and the    [RangeSlider]'s overlay. {@endtemplate}''',
      keyword: 'SliderTheme',
      documentationUrl: 'https://api.flutter.dev/flutter/material/SliderTheme-class.html',
      buildRoute: (context) => BaseWidget('SliderTheme', codePath + 'slidertheme', SliderThemeWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'Switch',
      subtitle: 'On/off switches toggle the state of a single settings option. The Switch widget implements this component.',
      keyword: 'Switch',
      documentationUrl: 'https://api.flutter.dev/flutter/material/Switch-class.html',
      buildRoute: (context) => BaseWidget('Switch', codePath + 'switch', SwitchWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'SwitchListTile',
      subtitle: 'A [ListTile] with a [Switch]. In other words, a switch with a label.',
      keyword: 'SwitchListTile',
      documentationUrl: 'https://api.flutter.dev/flutter/material/SwitchListTile-class.html',
      buildRoute: (context) => BaseWidget('SwitchListTile', codePath + 'switchlisttile', SwitchListTileWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'TextField InputDecorator',
      subtitle: 'Touching a text field places the cursor and displays the keyboard. The TextField widget implements this component.',
      keyword: 'TextField',
      documentationUrl: 'https://docs.flutter.io/flutter/material/TextField-class.html',
      buildRoute: (context) => BaseWidget('TextField', codePath + 'textfield', TextFieldWidget()),
    ),
    DemoItem(
      icon: Icons.input,
      title: 'TextFormField',
      subtitle: 'A [FormField] that contains a [TextField].',
      keyword: 'TextFormField',
      documentationUrl: 'https://docs.flutter.io/flutter/material/TextFormField-class.html',
      buildRoute: (context) => BaseWidget('TextFormField', codePath + 'textformfield', TextFormFieldWidget()),
    )
  ];
}
