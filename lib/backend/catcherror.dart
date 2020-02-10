import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class CatchErrorWidget extends StatefulWidget {
  @override
  _CatchErrorWidgetState createState() => _CatchErrorWidgetState();
}

class _CatchErrorWidgetState extends State<CatchErrorWidget> {
  String url = '';
  String msg = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('Catch Image Error'),
          MultiSelectionWidget(
            'Image Url',
            [
              'https://img.favpng.com/25/9/1/dart-google-developers-flutter-android-png-favpng-vi7iwNmVaBCVr91EF35XrnFfc.jpg',
              'xuyisheng',
              'https://www.baidu.com',
            ],
            [
              '正确URL',
              '错误URL',
              '非图片URL',
            ],
            (value) {
              setState(() => url = value);
            },
          ),
          safeImageWidget(url),
          Text(msg),
        ],
      ),
    );
  }

  safeImageWidget(String url) {
    Image image = Image.network(url);
    final ImageStream stream = image.image.resolve(ImageConfiguration.empty);
    stream.addListener(ImageStreamListener((_, __) {
      msg = '';
    }, onError: (e, trace) {
      msg = '$e-$trace';
    }));
    return image;
  }
}
