import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

class ScrollingAnimation3Widget extends StatefulWidget {
  @override
  _ScrollingAnimation3WidgetState createState() => _ScrollingAnimation3WidgetState();
}

class _ScrollingAnimation3WidgetState extends State<ScrollingAnimation3Widget> {
  ScrollController controller = ScrollController();
  var appBarHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: appBarHeight,
          automaticallyImplyLeading: false,
          floating: true,
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              double percent = ((constraints.maxHeight - kToolbarHeight) * 100 / (appBarHeight - kToolbarHeight));
              double angle = percent * 90 / 100;
              return Stack(
                children: <Widget>[
                  //image background
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Transform.rotate(
                      alignment: Alignment.bottomLeft,
                      angle: radians(angle),
                      child: Text(
                        "FlutteRotate",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ListTile(title: Text("Flutter / $index"));
            },
          ),
        ),
      ],
    );
  }
}
