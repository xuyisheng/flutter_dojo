import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/widgets/dialogsalertspanels/aboutdialog.dart';
import 'package:flutter_dojo/category/widgets/dialogsalertspanels/alertdialog.dart';
import 'package:flutter_dojo/category/widgets/dialogsalertspanels/bottomsheet.dart';
import 'package:flutter_dojo/category/widgets/dialogsalertspanels/datepicker.dart';
import 'package:flutter_dojo/category/widgets/dialogsalertspanels/expansionpanel.dart';
import 'package:flutter_dojo/category/widgets/dialogsalertspanels/simpledialog.dart';
import 'package:flutter_dojo/category/widgets/dialogsalertspanels/snackbar.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItem> buildDialogsAlertsPanelsDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.dialpad,
      title: 'AboutDialog',
      subtitle:'AboutDialog',
      keyword: 'AboutDialog',
      documentationUrl: 'https://api.flutter.dev/flutter/material/AboutDialog-class.html',
      buildRoute: (context) => BaseWidget('AboutDialog', codePath + 'aboutdialog', AboutDialogWidget()),
    ),
    DemoItem(
      icon: Icons.dialpad,
      title: 'AlertDialog',
      subtitle:
          'Alerts are urgent interruptions requiring acknowledgement that inform the user about a situation. The AlertDialog widget implements this component.',
      keyword: 'AlertDialog',
      documentationUrl: 'https://api.flutter.dev/flutter/material/AlertDialog-class.html',
      buildRoute: (context) => BaseWidget('AlertDialog', codePath + 'alertdialog', AlertDialogWidget()),
    ),
    DemoItem(
      icon: Icons.dialpad,
      title: 'BottomSheet',
      subtitle: 'Bottom sheets slide up from the bottom of the screen to reveal more content.',
      keyword: 'BottomSheet',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/BottomSheet-class.html',
      buildRoute: (context) => BaseWidget('BottomSheet', codePath + 'bottomsheet', BottomSheetWidget()),
    ),
    DemoItem(
      icon: Icons.dialpad,
      title: 'DatePicker',
      subtitle: 'DatePicker',
      keyword: 'DatePicker',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/DatePicker-class.html',
      buildRoute: (context) => BaseWidget('DatePicker', codePath + 'datepicker', DatePickerWidget()),
    ),
    DemoItem(
      icon: Icons.dialpad,
      title: 'ExpansionPanel',
      subtitle:
          'Expansion panels contain creation flows and allow lightweight editing of an element. The ExpansionPanel widget implements this component.',
      keyword: 'ExpansionPanel',
      documentationUrl: 'https://api.flutter.dev/flutter/widgets/ExpansionPanel-class.html',
      buildRoute: (context) => BaseWidget('ExpansionPanel', codePath + 'expansionpanel', ExpansionPanelWidget()),
    ),
    DemoItem(
      icon: Icons.dialpad,
      title: 'SimpleDialog',
      subtitle: 'Simple dialogs can provide additional details or actions about a list item.',
      keyword: 'SimpleDialog',
      documentationUrl: 'https://api.flutter.dev/flutter/material/SimpleDialog-class.html',
      buildRoute: (context) => BaseWidget('SimpleDialog', codePath + 'simpledialog', SimpleDialogWidget()),
    ),
    DemoItem(
      icon: Icons.dialpad,
      title: 'SnackBar',
      subtitle: 'A lightweight message with an optional action which briefly displays at the bottom of the screen.',
      keyword: 'SnackBar',
      documentationUrl: 'https://api.flutter.dev/flutter/material/SnackBar-class.html',
      buildRoute: (context) => BaseWidget('SnackBar', codePath + 'snackbar', SnackBarWidget()),
    )
  ];
}
