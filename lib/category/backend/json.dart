import 'dart:convert' show json;

import 'package:flutter/material.dart';

class JsonWidget extends StatefulWidget {
  @override
  _JsonWidgetState createState() => _JsonWidgetState();
}

class _JsonWidgetState extends State<JsonWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16),
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("assets/json/basicMap.json"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic> decodeJson = json.decode(snapshot.data);
                return Text(decodeJson.toString());
              } else {
                return Text('loading...');
              }
            },
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(16),
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString("assets/json/basicMap.json"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map<String, dynamic> decodeJson = json.decode(snapshot.data);
                    BasicMap basicModel = BasicMap.fromJson(decodeJson);
                    return Text(basicModel.toString());
                  } else {
                    return Text('loading...');
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString("assets/json/basicMapWithList.json"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map<String, dynamic> decodeJson = json.decode(snapshot.data);
                    BasicMapWithList basicModel = BasicMapWithList.fromJson(decodeJson);
                    return Text(basicModel.toString());
                  } else {
                    return Text('loading...');
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString("assets/json/basicMapWithModel.json"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map<String, dynamic> decodeJson = json.decode(snapshot.data);
                    BasicMapWithModel basicModel = BasicMapWithModel.fromJson(decodeJson);
                    return Text(basicModel.toString());
                  } else {
                    return Text('loading...');
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString("assets/json/basicMapWithListModel.json"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map<String, dynamic> decodeJson = json.decode(snapshot.data);
                    BasicMapWithListModel basicModel = BasicMapWithListModel.fromJson(decodeJson);
                    return Text(basicModel.toString());
                  } else {
                    return Text('loading...');
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString("assets/json/basicList.json"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<dynamic> decodeJson = json.decode(snapshot.data);
                    BasicList basicModel = BasicList.fromJson(decodeJson);
                    return Text(basicModel.toString());
                  } else {
                    return Text('loading...');
                  }
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}

class BasicMap {
  int code;
  String result;
  String message;

  BasicMap.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        result = json['result'],
        message = json['message'];

  @override
  String toString() {
    return 'BasicModel: code: $code ,result: $result ,message: $message';
  }
}

class BasicMapWithList {
  int code;
  String result;
  String message;
  List<String> data;

  BasicMapWithList.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        result = json['result'],
        message = json['message'],
        data = List<String>.from(json['data']);

  @override
  String toString() {
    return 'BasicModel: code: $code ,result: $result ,message: $message ,data: ${data.toString()}';
  }
}

class BasicMapWithModel {
  int code;
  String result;
  String message;
  Data data;

  BasicMapWithModel.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        result = json['result'],
        message = json['message'],
        data = Data.fromJson(json['data']);

  @override
  String toString() {
    return 'BasicModel: code: $code ,result: $result ,message: $message ,data: ${data.toString()}';
  }
}

class Data {
  String name;
  int age;

  Data.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];

  @override
  String toString() {
    return 'name: $name ,age: $age';
  }
}

class BasicMapWithListModel {
  int code;
  String result;
  String message;
  List<Person> data;

  BasicMapWithListModel.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        result = json['result'],
        message = json['message'],
        data = (List.from(json['data'])).map((i) => Person.fromJson(i)).toList();

  @override
  String toString() {
    return 'BasicModel: code: $code ,result: $result ,message: $message ,data: ${data.toString()}';
  }
}

class Person {
  String name;
  int age;

  Person.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];

  @override
  String toString() {
    return 'name: $name ,age: $age';
  }
}

class BasicList {
  List<Family> families;

  BasicList.fromJson(List<dynamic> json) : families = json.map((i) => Family.fromJson(i)).toList();

  @override
  String toString() {
    return 'BasicList: $families';
  }
}

class Family {
  String name;
  String sex;
  int age;

  Family.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        sex = json['sex'],
        age = json['age'];

  @override
  String toString() {
    return 'name: $name ,age: $age ,sex: $sex';
  }
}
