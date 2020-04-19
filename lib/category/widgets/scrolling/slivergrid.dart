import 'package:flutter/material.dart';

class SliverGridWidget extends StatelessWidget {
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
            titlePadding: EdgeInsets.only(left: 55, bottom: 15),
            collapseMode: CollapseMode.parallax,
            background: Image.asset(
              "images/book.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(padding: EdgeInsets.all(8)),
        SliverGrid.extent(
          childAspectRatio: 4 / 3,
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: List.generate(
            20,
            (index) {
              return Container(
                alignment: Alignment.center,
                height: 60,
                color: Colors.grey.shade200,
                child: Text(
                  'Android群英传',
                  style: TextStyle(color: Colors.black38),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
