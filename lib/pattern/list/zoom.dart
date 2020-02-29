import 'dart:math';

import 'package:flutter/material.dart';

class ZoomWidget extends StatefulWidget {
  @override
  _ZoomWidgetState createState() => _ZoomWidgetState();
}

class _ZoomWidgetState extends State<ZoomWidget> {
  ScrollController controller;
  double offset = 0;
  final double headerHeight = 150;

  _scrollListener() {
    setState(() => offset = controller.offset);
  }

  double _getHeaderHeight() {
    if (offset == null) return headerHeight;
    if (offset <= 0) {
      return min(max((headerHeight - offset), headerHeight), 250);
    } else {
      return max(min((headerHeight - offset), headerHeight), 50);
    }
  }

  @override
  void initState() {
    controller = ScrollController();
    controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: _getHeaderHeight(),
          child: Container(
            child: Image.asset('images/book.jpg', fit: BoxFit.cover),
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            controller: controller,
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(title: Text("Item : $index"));
            },
          ),
        ),
      ],
    );
  }
}
