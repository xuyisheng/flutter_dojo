import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class CatchErrorWidget extends StatefulWidget {
  @override
  _CatchErrorWidgetState createState() => _CatchErrorWidgetState();
}

class _CatchErrorWidgetState extends State<CatchErrorWidget> {
  String url = '';
  String msgDart = '';
  String msgImage = '';
  String msgFlutter = '';
  String msgFuture = '';

  @override
  Widget build(BuildContext context) {
    FlutterError.onError = (FlutterErrorDetails details) {
      setState(() => msgFlutter = 'Catch--${details.toString()}');
    };
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('Catch Dart Error'),
          RaisedButton(
            onPressed: () {
              try {
                throw Exception('new exception');
              } catch (e) {
                setState(() => msgDart = e.toString());
              } finally {}
            },
            child: Text('Throw Exception'),
          ),
          Text(msgDart),
          MainTitleWidget('Catch Flutter Layout Error'),
          RaisedButton(
            onPressed: () {
              throw Exception('flutter exception');
            },
            child: Text('Throw Flutter Exception'),
          ),
          Text(msgFlutter, maxLines: 5),
          MainTitleWidget('Catch Future Error'),
          RaisedButton(
            onPressed: () {
              Future.error('Future Error').then((v) {
                throw Exception('Another Future Error');
              }, onError: (e) {
                debugPrint('Another Future Error');
                throw Exception('Another Future Error');
              }).catchError((e) {
                setState(() => msgFuture = e.toString());
              });
            },
            child: Text('Throw Flutter Exception'),
          ),
          Text(msgFuture),
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
          Text(msgImage, maxLines: 5),
        ],
      ),
    );
  }

  safeImageWidget(String url) {
    if (url.isEmpty) {
      return Container();
    }
    Image image = Image.network(url);
    final ImageStream stream = image.image.resolve(ImageConfiguration.empty);
    stream.addListener(ImageStreamListener((_, __) {
      msgImage = '';
    }, onError: (e, trace) {
      msgImage = '$e-$trace';
    }));
    return image;
  }
}
