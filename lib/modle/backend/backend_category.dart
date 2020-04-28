import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/backend/asyncmemoizer.dart';
import 'package:flutter_dojo/category/backend/catcherror.dart';
import 'package:flutter_dojo/category/backend/eventbus.dart';
import 'package:flutter_dojo/category/backend/file.dart';
import 'package:flutter_dojo/category/backend/json.dart';
import 'package:flutter_dojo/category/backend/keeppressing.dart';
import 'package:flutter_dojo/category/backend/key.dart';
import 'package:flutter_dojo/category/backend/keyboard.dart';
import 'package:flutter_dojo/category/backend/lifecycle.dart';
import 'package:flutter_dojo/category/backend/pageroute.dart';
import 'package:flutter_dojo/category/backend/pagestate.dart';
import 'package:flutter_dojo/category/backend/pagestoragekey.dart';
import 'package:flutter_dojo/category/backend/provider.dart';
import 'package:flutter_dojo/category/backend/providerstate.dart';
import 'package:flutter_dojo/category/backend/screenshot.dart';
import 'package:flutter_dojo/category/backend/sharedpreferences.dart';
import 'package:flutter_dojo/category/backend/singleton.dart';
import 'package:flutter_dojo/category/backend/sqflite.dart';
import 'package:flutter_dojo/category/backend/statemanagement.dart';
import 'package:flutter_dojo/category/backend/stream.dart';
import 'package:flutter_dojo/category/backend/templatewidget.dart';
import 'package:flutter_dojo/category/backend/timer.dart';
import 'package:flutter_dojo/common/base_widget.dart';
import 'package:flutter_dojo/common/demo_item.dart';

var codePath = 'lib/category/backend/';
List<DemoItem> buildBackendCategoryList = [
  DemoItem(
    icon: Icons.build,
    title: 'AsyncMemoizer',
    subtitle: 'AsyncMemoizer',
    documentationUrl: '',
    keyword: 'AsyncMemoizer',
    buildRoute: (context) => BaseWidget('AsyncMemoizer', codePath + 'asyncmemoizer', AsyncMemoizerWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'CatchError',
    subtitle: 'CatchError',
    documentationUrl: '',
    keyword: 'CatchError',
    buildRoute: (context) => BaseWidget('CatchError', codePath + 'catcherror', CatchErrorWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'EventBus',
    subtitle: 'EventBus',
    documentationUrl: '',
    keyword: 'EventBus',
    buildRoute: (context) => BaseWidget('EventBus', codePath + 'eventbus', EventBusWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'File',
    subtitle: 'File',
    documentationUrl: '',
    keyword: 'File',
    buildRoute: (context) => BaseWidget('File', codePath + 'file', FileWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'Json',
    subtitle: 'Json',
    documentationUrl: '',
    keyword: 'Json',
    buildRoute: (context) => BaseWidget('Json', codePath + 'json', JsonWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'KeepPressing',
    subtitle: 'KeepPressing',
    documentationUrl: '',
    keyword: 'KeepPressing',
    buildRoute: (context) => BaseWidget('KeepPressing', codePath + 'keeppressing', KeepPressingWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'Key',
    subtitle: 'Key',
    documentationUrl: '',
    keyword: 'Key',
    buildRoute: (context) => BaseWidget('Key', codePath + 'key', KeyWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'Keyboard',
    subtitle: 'Keyboard',
    documentationUrl: '',
    keyword: 'Keyboard',
    buildRoute: (context) => BaseWidget('Keyboard', codePath + 'keyboard', KeyboardWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'LifeCycle',
    subtitle: 'LifeCycle',
    documentationUrl: '',
    keyword: 'LifeCycle',
    buildRoute: (context) => BaseWidget('LifeCycle', codePath + 'lifecycle', LifeCycleWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'PageRoute',
    subtitle: 'PageRoute',
    documentationUrl: '',
    keyword: 'PageRoute',
    buildRoute: (context) => BaseWidget('PageRoute', codePath + 'pageroute', PageRouteWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'PageState',
    subtitle: 'PageState',
    documentationUrl: '',
    keyword: 'PageState',
    buildRoute: (context) => BaseWidget('PageState', codePath + 'pagestate', PageStateWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'PageStorageKey',
    subtitle: 'PageStorageKey',
    documentationUrl: '',
    keyword: 'PageStorageKey',
    buildRoute: (context) => BaseWidget('PageStorageKey', codePath + 'pagestoragekey', PageStorageKeyWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'Provider',
    subtitle: 'State management',
    documentationUrl: '',
    keyword: 'Provider',
    buildRoute: (context) => BaseWidget('Provider', codePath + 'provider', ProviderWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'ProviderState',
    subtitle: 'State management',
    documentationUrl: '',
    keyword: 'ProviderState',
    buildRoute: (context) => BaseWidget('Provider', codePath + 'providerstate', ProviderStateWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'Screenshot',
    subtitle: 'Screenshot',
    documentationUrl: '',
    keyword: 'Screenshot',
    buildRoute: (context) => BaseWidget('Screenshot', codePath + 'screenshot', ScreenshotWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'SharedPreferences',
    subtitle: 'SharedPreferences',
    documentationUrl: '',
    keyword: 'SharedPreferences',
    buildRoute: (context) => BaseWidget('SharedPreferences', codePath + 'sharedpreferences', SharedPreferencesWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'Singleton',
    subtitle: 'Singleton',
    documentationUrl: '',
    keyword: 'Singleton',
    buildRoute: (context) => BaseWidget('Singleton', codePath + 'singleton', SingletonWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'Sqflite',
    subtitle: 'Sqflite',
    documentationUrl: '',
    keyword: 'Sqflite',
    buildRoute: (context) => BaseWidget('Sqflite', codePath + 'sqflite', SqfliteWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'StateManagement',
    subtitle: 'State management',
    documentationUrl: '',
    keyword: 'StateManagement',
    buildRoute: (context) => BaseWidget('StateManagement', codePath + 'statemanagement', StateManagementWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'Stream',
    subtitle: 'Stream',
    documentationUrl: '',
    keyword: 'Stream',
    buildRoute: (context) => BaseWidget('Stream', codePath + 'stream', StreamWidget()),
  ),
  DemoItem(
    icon: Icons.build,
    title: 'TemplateWidget',
    subtitle: 'TemplateWidget',
    documentationUrl: '',
    keyword: 'TemplateWidget',
    buildRoute: (context) => BaseWidget('TemplateWidget', codePath + 'templatewidget', TemplateWidget()),
  ),
  DemoItem(
    icon: Icons.pages,
    title: 'Timer',
    subtitle: 'Timer',
    documentationUrl: '',
    keyword: 'Timer',
    buildRoute: (context) => BaseWidget('Timer', codePath + 'timer', TimerWidget()),
  ),
];
