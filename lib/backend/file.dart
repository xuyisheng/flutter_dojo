import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileWidget extends StatefulWidget {
  @override
  _FileWidgetState createState() => _FileWidgetState();
}

class _FileWidgetState extends State<FileWidget> {
  static const String filename = 'file_test.txt';

  String showText = 'None';
  TextEditingController _usernameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(hintText: 'Username'),
          ),
          RaisedButton(
            onPressed: () {
              _saveFile(filename);
            },
            child: Text('Save'),
          ),
          RaisedButton(
            onPressed: () {
              _saveFileWithIOSink(filename);
            },
            child: Text('Save with IOSink'),
          ),
          RaisedButton(
            onPressed: () {
              _readFile(filename);
            },
            child: Text('Read'),
          ),
          Text('Read from persistence :$showText'),
        ],
      ),
    );
  }

  Future _saveFileWithIOSink(String filename) async {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$filename');
    IOSink sink;
    try {
      sink = file.openWrite();
      // write()的参数是Object，flutter会执行obj.toString()把转换后的String写入文件
      sink.write('saveFileWithIOSink');
      await sink.flush();
    } catch (e) {
      print(e);
    } finally {
      sink?.close();
    }
  }

  Future _saveFile(String filename) async {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$filename');
    file.writeAsString(_usernameController.value.text.toString());
    // 写入的其它方式
//    file.openWrite(mode: FileMode.append).write('new line');
  }

  Future _readFile(String filename) async {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$filename');
    showText = await file.readAsString() + ' in path:' + file.path.toString();
    // 读取的其它方式
    file.openRead().listen((data) {
      data.forEach((value) {
        debugPrint(String.fromCharCode(value));
      });
    });
    setState(() {});
  }
}
