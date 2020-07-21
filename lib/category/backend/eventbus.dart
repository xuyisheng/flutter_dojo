import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class EventBusWidget extends StatefulWidget {
  @override
  _EventBusWidgetState createState() => _EventBusWidgetState();
}

class _EventBusWidgetState extends State<EventBusWidget> {
  TextEditingController controller = TextEditingController();
  String textValue = '';

  @override
  void initState() {
    super.initState();
    bus.register('event', (value) {
      setState(() => textValue = 'Event value is $value');
    });
  }

  @override
  void dispose() {
    bus.unregister('event');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('实现一个简单的EventBus'),
        Text(textValue),
        TextField(controller: controller),
        RaisedButton(
          onPressed: () {
            bus.postEvent('event', controller.text);
          },
          child: Text('Send event'),
        ),
      ],
    );
  }
}

typedef void EventCallback(v);

class EventBus {
  EventBus._internal();

  static EventBus _singleton = EventBus._internal();

  factory EventBus() => _singleton;

  var _obList = Map<Object, List<EventCallback>>();

  void register(eventName, EventCallback callback) {
    if (eventName == null || callback == null) return;
    _obList[eventName] ??= List<EventCallback>();
    _obList[eventName].add(callback);
  }

  void unregister(eventName, [EventCallback callback]) {
    var list = _obList[eventName];
    if (eventName == null || list == null) return;
    if (callback == null) {
      _obList[eventName] = null;
    } else {
      list.remove(callback);
    }
  }

  void postEvent(eventName, [v]) {
    var list = _obList[eventName];
    if (list == null) return;
    list.reversed.forEach((item) => item(v));
  }
}

var bus = EventBus();
