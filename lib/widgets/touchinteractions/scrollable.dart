import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ScrollableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Scrollable基本使用'),
        Expanded(
          child: Scrollable(
            axisDirection: AxisDirection.down,
            controller: ScrollController(),
            physics: ScrollPhysics(),
            viewportBuilder: (BuildContext context, ViewportOffset position) {
              return Viewport(
                offset: position,
                cacheExtent: 0.0,
                slivers: <Widget>[
                  SliverFillViewport(
                    delegate: SliverChildListDelegate([
                      Image.asset('images/logo.png'),
                      Image.asset('images/logo.png'),
                    ]),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
