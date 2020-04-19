import 'package:flutter/material.dart';

class SliverPaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200,
          title: Text('Android群英传'),
          pinned: true,
          backgroundColor: Colors.blueAccent,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Image.asset(
              "images/book.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(24),
          sliver: SliverList(
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
        ),
      ],
    );
  }
}
