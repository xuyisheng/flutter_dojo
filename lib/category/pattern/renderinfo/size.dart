import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class SizeWidget extends StatefulWidget {
  @override
  _SizeWidgetState createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  final GlobalKey globalKey = GlobalKey();
  var showSize = '';
  var showSizeWithCallback = '';

  void getSizeWithContext() {
    final containerWidth = globalKey.currentContext.size.width;
    final containerHeight = globalKey.currentContext.size.height;
    showSize = 'Context Container Width $containerWidth\n'
        'Container Height $containerHeight';
  }

  void getSizeWithKey() {
    RenderBox box = globalKey.currentContext.findRenderObject();
    showSize = 'PaintBounds Container Width ${box.paintBounds.width}\n'
        'Container Height ${box.paintBounds.width}';
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(getPositionWithPostFrameCallback);
    super.initState();
  }

  getPositionWithPostFrameCallback(_) {
    setState(() {
      RenderBox box = globalKey.currentContext.findRenderObject();
      showSizeWithCallback = 'getPositionWithPostFrameCallback\n'
          'PaintBounds Container Width ${box.paintBounds.width}\n'
          'Container Height ${box.paintBounds.width}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('通过MediaQuery获取Size信息'),
        Text('屏幕宽度 ${MediaQuery.of(context).size.width} 逻辑像素\n'
            '屏幕高度 ${MediaQuery.of(context).size.height} 逻辑像素\n'
            '状态栏高度 ${MediaQuery.of(context).padding.top}'),
        Text('DevicePixelRatio ${MediaQuery.of(context).devicePixelRatio}'),
        MainTitleWidget('通过window获取Size信息'),
        Text('屏幕宽度 ${window.physicalSize.width} 物理像素\n'
            '屏幕高度 ${window.physicalSize.height} 物理像素'),
        MainTitleWidget('通过GlobalKey获取指定Widget的Size信息'),
        SubtitleWidget('需要注意的是，必须在Build之后才能获取Size信息，因为其原理是通过Context获取'),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            key: globalKey,
            color: Colors.red,
            width: 100,
            height: 100,
          ),
        ),
        SubtitleWidget('Sliver相关的Widget不能通过Context来获取Size，只能通过PaintBounds来获取'),
        Text(showSize),
        RaisedButton(
          onPressed: () {
            setState(() => getSizeWithContext());
          },
          child: Text('Get Container Size with Context'),
        ),
        RaisedButton(
          onPressed: () {
            setState(() => getSizeWithKey());
          },
          child: Text('Get Container Size with PaintBounds'),
        ),
        MainTitleWidget('在渲染完成后直接获取Widget的Position'),
        SubtitleWidget('WidgetsBinding.instance.addPostFrameCallback()来获取尺寸数据'),
        Text(showSizeWithCallback),
      ],
    );
  }
}
