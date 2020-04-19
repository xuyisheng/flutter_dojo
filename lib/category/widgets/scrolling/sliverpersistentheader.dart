import 'dart:math';

import 'package:flutter/material.dart';

class SliverPersistentHeaderWidget extends StatelessWidget {
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
            background: Image.asset('images/book.jpg', fit: BoxFit.cover),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverDelegate(
            minHeight: 48,
            maxHeight: 96,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent.withAlpha(100),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(child: Text('设置透明效果理解SliverPersistentHeader')),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text('神兵利器'),
                ),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text('修仙指南'),
                ),
              ],
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: false,
          delegate: _SliverDelegate(
            minHeight: 48,
            maxHeight: 96,
            child: Container(
              color: Colors.green.shade200,
              child: Center(child: Text('SliverPersistentHeader设置pinned为flase')),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, int index) => Container(
              margin: EdgeInsets.all(8),
              child: Text(
                'Other list',
                style: TextStyle(color: Colors.black38),
              ),
            ),
            childCount: 20,
          ),
        ),
      ],
    );
  }
}

class _SliverDelegate extends SliverPersistentHeaderDelegate {
  _SliverDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
