import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class DrawImageWidget extends StatefulWidget {
  @override
  _DrawImageWidgetState createState() => _DrawImageWidgetState();
}

class _DrawImageWidgetState extends State<DrawImageWidget> {
  ui.Image image;

  @override
  Widget build(BuildContext context) {
    ImageUtil.drawImageWithClipShader('images/xys.jpg', 'images/mask.png').then((value) {
      setState(() => image = value);
    });
    return Column(
      children: <Widget>[
        MainTitleWidget('图形遮罩裁剪'),
        CustomPaint(
          painter: DrawImage(image),
          size: Size(200, 140),
        ),
      ],
    );
  }
}

class DrawImage extends CustomPainter {
  DrawImage(this._image);

  ui.Image _image;
  Paint _paint = new Paint();

  @override
  void paint(Canvas canvas, Size size) {
    if (_image != null) {
      canvas.drawImageRect(
        _image,
        Rect.fromLTWH(
          0,
          0,
          _image.width.toDouble(),
          _image.height.toDouble(),
        ),
        Rect.fromLTWH(0, 0, size.width, size.height),
        _paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ImageUtil {
  static AssetBundle getAssetBundle() =>
      (rootBundle != null) ? rootBundle : NetworkAssetBundle(Uri.directory(Uri.base.origin));

  static Future<ui.Image> load(String url) {
    ImageStream stream = AssetImage(url, bundle: getAssetBundle()).resolve(ImageConfiguration.empty);
    Completer<ui.Image> completer = Completer<ui.Image>();
    void listener(ImageInfo frame, bool synchronousCall) {
      final ui.Image image = frame.image;
      completer.complete(image);
      stream.removeListener(ImageStreamListener(listener));
    }

    stream.addListener(ImageStreamListener(listener));
    return completer.future;
  }

  /// 根据Shader裁剪图片
  static Future<ui.Image> drawImageWithClipShader(String imageURL, String shaderURL) {
    Completer<ui.Image> completer = new Completer<ui.Image>();
    Future.wait([load(imageURL), load(shaderURL)]).then((result) {
      Paint paint = new Paint();
      ui.PictureRecorder recorder = ui.PictureRecorder();
      Canvas canvas = Canvas(recorder);
      int shaderWidth = result[1].width;
      int shaderHeight = result[1].height;
      double imageWidth = 0.0;
      double imageHeight = 0.0;
      if (shaderWidth > shaderHeight) {
        double scale = shaderHeight / shaderWidth.toDouble();
        imageWidth = result[0].width.toDouble();
        imageHeight = result[0].height.toDouble() * scale;
      } else {
        double scale = shaderWidth / shaderHeight.toDouble();
        imageWidth = result[0].width.toDouble() * scale;
        imageHeight = result[0].height.toDouble();
      }
      canvas.drawImageRect(
          result[0],
          Rect.fromLTWH(
            (result[0].width - imageWidth) / 2.0,
            (result[0].height - imageHeight) / 2.0,
            imageWidth,
            imageHeight,
          ),
          Rect.fromLTWH(0, 0, shaderWidth.toDouble(), shaderHeight.toDouble()),
          paint);
      paint.blendMode = BlendMode.dstIn;
      canvas.drawImage(result[1], Offset(0, 0), paint);
      recorder.endRecording().toImage(shaderWidth, shaderHeight).then((image) {
        completer.complete(image);
      });
    }).catchError((e) => print('load error:' + e));
    return completer.future;
  }
}
