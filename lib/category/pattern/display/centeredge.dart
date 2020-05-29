import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CenterEdgeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('通过OverflowBox实现'),
        Container(
          height: 200,
          color: Colors.blueAccent,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.grey,
              width: 100,
              height: 0,
              child: OverflowBox(
                minWidth: 0,
                maxWidth: 100,
                minHeight: 0,
                maxHeight: 100,
                child: Image.asset('images/owl.jpg'),
              ),
            ),
          ),
        ),
        SizedBox(height: 160),
        MainTitleWidget('通过CustomSingleChildLayout实现'),
        Container(
          height: 200,
          alignment: Alignment.bottomLeft,
          color: Colors.grey,
          child: CenterEdge(
            align: EdgeAlign.bottomLeft,
            offset: Offset(0, -50),
            child: Image.asset(
              'images/owl.jpg',
              width: 100,
            ),
          ),
        ),
        SizedBox(height: 100),
      ],
    );
  }
}

enum EdgeAlign { topLeft, topRight, bottomLeft, bottomRight }

class CenterEdge extends StatelessWidget {
  final Offset offset;
  final Widget child;
  final EdgeAlign align;

  CenterEdge({this.offset = Offset.zero, this.child, this.align = EdgeAlign.topLeft});

  @override
  Widget build(BuildContext context) {
    return CustomSingleChildLayout(
      delegate: _OffSetDelegate(offset: offset, align: align),
      child: child,
    );
  }
}

class _OffSetDelegate extends SingleChildLayoutDelegate {
  final Offset offset;
  final EdgeAlign align;

  _OffSetDelegate({this.offset = Offset.zero, this.align = EdgeAlign.topLeft});

  @override
  bool shouldRelayout(_OffSetDelegate oldDelegate) => offset != oldDelegate.offset;

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    var w = size.width;
    var h = size.height;
    var childWidth = childSize.width;
    var childHeight = childSize.height;

    switch (align) {
      case EdgeAlign.topLeft:
        return offset;
      case EdgeAlign.topRight:
        return Offset(w - childWidth - offset.dx, offset.dy);
      case EdgeAlign.bottomLeft:
        return Offset(offset.dx, h - childHeight - offset.dy);
      case EdgeAlign.bottomRight:
        return Offset(w - childWidth - offset.dx, h - childHeight - offset.dy);
    }
    return offset;
  }
}
