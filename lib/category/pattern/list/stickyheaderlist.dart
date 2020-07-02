import 'package:flutter/material.dart';

class StickyHeaderListWidget extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 8.0,
              ),
            ],
          ),
          child: AppBar(
            centerTitle: true,
            title: Text(
              'Sticky',
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
          ),
        ),
        Expanded(
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(8),
                            height: 80,
                            color: Colors.yellowAccent,
                            child: Center(child: Text('header')),
                          ),
                        ],
                      );
                    },
                    childCount: 2,
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: StickyHeader(
                    Container(
                      height: 50,
                      color: Colors.greenAccent,
                      child: Center(child: Text('Stick header')),
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.only(top: 8),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    height: 200,
                    color: Colors.blueAccent,
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}

class StickyHeader extends SliverPersistentHeaderDelegate {
  StickyHeader(
    this.child,
  );

  final Widget child;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
