import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class ScrollableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Scrollable基本使用'),
        SubtitleWidget('Scrollable是InheritedWidget，因此可以在Child中共享状态(demo中点击最后一个调用)'),
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
                      Image.asset('images/logo.png'),
                      TapWidget(),
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

class TapWidget extends StatelessWidget {
  const TapWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScrollableState state = Scrollable.of(context);
        state.position.jumpTo(0);
      },
      child: Image.asset('images/book.jpg'),
    );
  }
}
