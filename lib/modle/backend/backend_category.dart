import 'package:flutter/material.dart';
import 'package:flutter_dojo/backend/catcherror.dart';
import 'package:flutter_dojo/backend/file.dart';
import 'package:flutter_dojo/backend/json.dart';
import 'package:flutter_dojo/backend/lifecycle.dart';
import 'package:flutter_dojo/backend/pageroute.dart';
import 'package:flutter_dojo/backend/provider.dart';
import 'package:flutter_dojo/backend/sharedpreferences.dart';
import 'package:flutter_dojo/backend/sqflite.dart';
import 'package:flutter_dojo/backend/stream.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

var codePath = 'lib/backend/';
List<DemoItem> buildBackendCategoryList = [
  DemoItem(
    icon: Icons.build,
    title: 'CatchError',
    subtitle: 'CatchError',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('CatchError', codePath, CatchErrorWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'File',
    subtitle: 'File',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('File', codePath, FileWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'LifeCycle',
    subtitle: 'LifeCycle',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('LifeCycle', codePath, LifeCycleWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'Json',
    subtitle: 'Json',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('Json', codePath, JsonWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'PageRoute',
    subtitle: 'PageRoute',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('PageRoute', codePath, PageRouteWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'Provider',
    subtitle: 'State management',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('Provider', codePath, ProviderWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'Stream',
    subtitle: 'Stream',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('Stream', codePath, StreamWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'SharedPreferences',
    subtitle: 'SharedPreferences',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('SharedPreferences', codePath, SharedPreferencesWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'Sqflite',
    subtitle: 'Sqflite',
    documentationUrl: '',
    buildRoute: (context) => BaseWidget('Sqflite', codePath, SqfliteWidget()),
  ),
];
