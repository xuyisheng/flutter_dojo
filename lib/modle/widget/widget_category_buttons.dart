import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/widgets/buttons/backbutton.dart';
import 'package:flutter_dojo/category/widgets/buttons/buttonbar.dart';
import 'package:flutter_dojo/category/widgets/buttons/dropdownbutton.dart';
import 'package:flutter_dojo/category/widgets/buttons/expandicon.dart';
import 'package:flutter_dojo/category/widgets/buttons/flatbutton.dart';
import 'package:flutter_dojo/category/widgets/buttons/floatingactionbutton.dart';
import 'package:flutter_dojo/category/widgets/buttons/iconbutton.dart';
import 'package:flutter_dojo/category/widgets/buttons/outlinebutton.dart';
import 'package:flutter_dojo/category/widgets/buttons/popupmenubutton.dart';
import 'package:flutter_dojo/category/widgets/buttons/raisedbutton.dart';
import 'package:flutter_dojo/category/widgets/buttons/rawmaterialbutton.dart';
import 'package:flutter_dojo/category/widgets/buttons/togglebutton.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

List<DemoItem> buildButtonsDemoItems(String codePath) {
  return [
    DemoItem(
      icon: Icons.check_box,
      title: 'ButtonBar',
      subtitle: 'A horizontal arrangement of buttons.',
      keyword: 'ButtonBar',
      documentationUrl: 'https://api.flutter.dev/flutter/material/ButtonBar-class.html',
      buildRoute: (context) => BaseWidget('ButtonBar', codePath + 'buttonbar', ButtonBarWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'BackButton',
      subtitle: 'BackButton',
      keyword: 'BackButton',
      documentationUrl: 'https://docs.flutter.io/flutter/material/BackButton-class.html',
      buildRoute: (context) => BaseWidget('BackButton', codePath + 'backbutton', BackButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'DropdownButton',
      subtitle: 'Shows the currently selected item and an arrow that opens a menu for selecting another item.',
      keyword: 'DropdownButton',
      documentationUrl: 'https://api.flutter.dev/flutter/material/DropdownButton-class.html',
      buildRoute: (context) => BaseWidget('DropdownButton', codePath + 'dropdownbutton', DropdownButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'ExpandIcon',
      subtitle: 'ExpandIcon',
      keyword: 'ExpandIcon',
      documentationUrl: 'https://api.flutter.dev/flutter/material/ExpandIcon-class.html',
      buildRoute: (context) => BaseWidget('ExpandIcon', codePath + 'expandicon', ExpandIconWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'FlatButton',
      subtitle:
          'A flat button is a section printed on a Material Components widget that reacts to touches by filling with color.',
      keyword: 'FlatButton',
      documentationUrl: 'https://docs.flutter.io/flutter/material/FlatButton-class.html',
      buildRoute: (context) => BaseWidget('FlatButton', codePath + 'flatbutton', FlatButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'FloatingActionButton',
      subtitle:
          'A floating action button is a circular icon button that hovers over content to promote a primary action in the application. Floating action buttons are most commonly used in the Scaffold.floatingActionButton field.',
      keyword: 'FloatingActionButton',
      documentationUrl: 'https://api.flutter.dev/flutter/material/FloatingActionButton-class.html',
      buildRoute: (context) =>
          BaseWidget('FloatingActionButton', codePath + 'floatingactionbutton', FloatingActionButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'IconButton',
      subtitle:
          'An icon button is a picture printed on a Material widget that reacts to touches by filling with color (ink).',
      keyword: 'IconButton',
      documentationUrl: 'https://api.flutter.dev/flutter/material/IconButton-class.html',
      buildRoute: (context) => BaseWidget('IconButton', codePath + 'iconbutton', IconButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'OutlineButton',
      subtitle: 'OutlineButton',
      keyword: 'OutlineButton',
      documentationUrl: 'https://docs.flutter.io/flutter/material/OutlineButton-class.html',
      buildRoute: (context) => BaseWidget('OutlineButton', codePath + 'outlinebutton', OutlineButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'PopupMenuButton',
      subtitle:
          'Displays a menu when pressed and calls onSelected when the menu is dismissed because an item was selected.',
      keyword: 'PopupMenuButton',
      documentationUrl: 'https://api.flutter.dev/flutter/material/PopupMenuButton-class.html',
      buildRoute: (context) => BaseWidget('PopupMenuButton', codePath + 'popupmenubutton', PopupMenuButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'RaisedButton',
      subtitle:
          'A Material Design raised button. A raised button consists of a rectangular piece of material that hovers over the interface.',
      keyword: 'RaisedButton',
      documentationUrl: 'https://docs.flutter.io/flutter/material/RaisedButton-class.html',
      buildRoute: (context) => BaseWidget('RaisedButton', codePath + 'raisedbutton', RaisedButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'RawMaterialButton',
      subtitle: 'RawMaterialButton',
      keyword: 'RawMaterialButton',
      documentationUrl: 'https://docs.flutter.io/flutter/material/RawMaterialButton-class.html',
      buildRoute: (context) =>
          BaseWidget('RawMaterialButton', codePath + 'rawmaterialbutton', RawMaterialButtonWidget()),
    ),
    DemoItem(
      icon: Icons.check_box,
      title: 'ToggleButton',
      subtitle: 'ToggleButton',
      keyword: 'ToggleButton',
      documentationUrl: 'https://docs.flutter.io/flutter/material/ToggleButton-class.html',
      buildRoute: (context) => BaseWidget('ToggleButton', codePath + 'togglebutton', ToggleButtonWidget()),
    ),
  ];
}
