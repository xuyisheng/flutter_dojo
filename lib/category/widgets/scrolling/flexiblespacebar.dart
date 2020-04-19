import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class FlexibleSpaceBarWidget extends StatefulWidget {
  @override
  _FlexibleSpaceBarWidgetState createState() => _FlexibleSpaceBarWidgetState();
}

class _FlexibleSpaceBarWidgetState extends State<FlexibleSpaceBarWidget> {
  var mode = CollapseMode.none;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('FlexibleSpaceBar基本用法'),
        MultiSelectionWidget(
          'collapseMode',
          CollapseMode.values,
          CollapseMode.values,
          (v) => setState(() => mode = v),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 200,
                title: Text('Android群英传'),
                pinned: true,
                backgroundColor: Colors.blueAccent,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: mode,
                  background: Image.asset(
                    "images/book.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) => Container(
                    color: Colors.grey.shade200,
                    height: 40,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(8),
                    child: Text(
                      'ssss',
                      style: TextStyle(color: Colors.black38),
                    ),
                  ),
                  childCount: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
