import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class FloatingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Overlay、Draggable实现悬浮窗'),
        RaisedButton(
          onPressed: () {
            TestOverLay.show(
              context: context,
              view: Material(
                child: Container(
                  child: Text(
                    'data',
                    style: TextStyle(fontSize: 50),
                  ),
                  color: Colors.blueAccent,
                ),
              ),
            );
          },
          child: Text('show floating window'),
        ),
        RaisedButton(
          onPressed: () {
            TestOverLay.remove();
          },
          child: Text('remove'),
        ),
      ],
    );
  }
}

class TestOverLay {
  static OverlayEntry _holder;

  static Widget widget;

  static void remove() {
    if (_holder != null) {
      _holder.remove();
      _holder = null;
    }
  }

  static void show({@required BuildContext context, @required Widget view}) {
    TestOverLay.widget = view;
    remove();
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: MediaQuery.of(context).size.height * 0.5,
          child: _buildDraggable(context),
        );
      },
    );
    Overlay.of(context).insert(overlayEntry);
    _holder = overlayEntry;
  }

  static _buildDraggable(context) {
    return Draggable(
      child: widget,
      feedback: widget,
      onDragEnd: (detail) {
        createDragTarget(offset: detail.offset, context: context);
      },
      childWhenDragging: Container(),
    );
  }

  static void refresh() {
    _holder.markNeedsBuild();
  }

  static void createDragTarget({Offset offset, BuildContext context}) {
    if (_holder != null) {
      _holder.remove();
    }
    _holder = OverlayEntry(
      builder: (context) {
        bool isLeft = true;
        if (offset.dx + 100 > MediaQuery.of(context).size.width / 2) {
          isLeft = false;
        }
        double maxY = MediaQuery.of(context).size.height - 100;
        return Positioned(
          top: offset.dy < 50 ? 50 : offset.dy < maxY ? offset.dy : maxY,
          left: isLeft ? 0 : null,
          right: isLeft ? null : 0,
          child: DragTarget(
            onWillAccept: (data) => true,
            builder: (BuildContext context, List incoming, List rejected) => _buildDraggable(context),
          ),
        );
      },
    );
    Overlay.of(context).insert(_holder);
  }
}
