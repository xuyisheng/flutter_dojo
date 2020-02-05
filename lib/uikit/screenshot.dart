import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ScreenshotWidget extends StatefulWidget {
  @override
  _ScreenshotWidgetState createState() => _ScreenshotWidgetState();
}

class _ScreenshotWidgetState extends State<ScreenshotWidget> {
  GlobalKey rootKey = GlobalKey();
  List<Uint8List> images = List();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: rootKey,
      child: Column(
        children: <Widget>[
          MainTitleWidget('Screenshot'),
          Image.asset(
            'images/book.jpg',
            width: 200,
          ),
          RaisedButton(
            onPressed: () {
              takeScreenshot();
            },
            child: Text('Take screenshot'),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Image.memory(
                  images[index],
                  fit: BoxFit.cover,
                );
              },
              itemCount: images.length,
            ),
          ),
        ],
      ),
    );
  }

  Future<Uint8List> takeScreenshot() async {
    try {
      RenderRepaintBoundary boundary = rootKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      images.add(pngBytes);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
