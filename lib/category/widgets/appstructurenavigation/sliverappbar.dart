import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class SliverAppBarWidget extends StatefulWidget {
  @override
  _SliverAppBarWidgetState createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  var pinned = false;
  var snap = false;
  var floating = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('SliverAppBar基本使用'),
        SubtitleWidget('SliverAppBar限制Title高度最小56'),
        Row(
          children: <Widget>[
            Text('Pinned'),
            Switch(
              value: pinned,
              onChanged: (value) {
                setState(() => pinned = value);
              },
            ),
            Text('Snap'),
            Switch(
              value: snap,
              onChanged: (value) {
                setState(() {
                  if (value) {
                    floating = true;
                  }
                  snap = value;
                });
              },
            ),
            Text('Floating'),
            Switch(
              value: floating,
              onChanged: (value) {
                setState(() => floating = value);
              },
            ),
          ],
        ),
        Expanded(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/flower.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text('SliverAppBar'),
                snap: snap,
                pinned: pinned,
                floating: floating,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      color: Colors.grey.shade200,
                    );
                  },
                  childCount: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
