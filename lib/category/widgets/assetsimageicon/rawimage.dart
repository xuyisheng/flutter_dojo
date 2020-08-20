import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class RawImageWidget extends StatefulWidget {
  @override
  _RawImageWidgetState createState() => _RawImageWidgetState();
}

class _RawImageWidgetState extends State<RawImageWidget> {
  ui.Image _img;

  @override
  void initState() {
    super.initState();
    _loadImageByAsset('assets/images/book.jpg').then((_urlImage) {
      setState(() => _img = _urlImage);
    });
  }

  Future<ui.Image> _loadImageByAsset(String asset) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('RawImage基本使用'),
        SubtitleWidget('RawImage是Image的原始实现，A widget that displays a [dart:ui.Image] directly.'),
        Container(
          child: RawImage(image: _img),
        ),
      ],
    );
  }
}
