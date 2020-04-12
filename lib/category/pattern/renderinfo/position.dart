import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class PositionWidget extends StatefulWidget {
  @override
  _PositionWidgetState createState() => _PositionWidgetState();
}

class _PositionWidgetState extends State<PositionWidget> {
  final GlobalKey globalKey = GlobalKey();
  var showPosition = '';
  var showPositionWithCallback = '';

  void getPosition() {
    RenderBox box = globalKey.currentContext.findRenderObject();
    showPosition = 'Container OffsetX ${box.localToGlobal(Offset.zero).dx}\n'
        'Container OffsetY ${box.localToGlobal(Offset.zero).dy}\n';
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(getPositionWithPostFrameCallback);
    super.initState();
  }

  getPositionWithPostFrameCallback(_) {
    setState(() {
      RenderBox box = globalKey.currentContext.findRenderObject();
      showPositionWithCallback = 'getPositionWithPostFrameCallback\n'
          'Container OffsetX ${box.localToGlobal(Offset.zero).dx}\n'
          'Container OffsetY ${box.localToGlobal(Offset.zero).dy}\n';
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('通过GlobalKey获取指定Widget的Position信息'),
        SubtitleWidget('需要注意的是，必须在Build之后才能获取Position信息，因为其原理是通过Context获取'),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            key: globalKey,
            color: Colors.red,
            width: 100,
            height: 100,
          ),
        ),
        Text(showPosition),
        RaisedButton(
          onPressed: () {
            setState(() => getPosition());
          },
          child: Text('Get Container Position'),
        ),
        MainTitleWidget('在渲染完成后直接获取Widget的Position'),
        SubtitleWidget('WidgetsBinding.instance.addPostFrameCallback()来获取尺寸数据'),
        Text(showPositionWithCallback),
      ],
    );
  }
}
