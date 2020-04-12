import 'package:flutter/material.dart';
import 'package:flutter_dojo/category/animation/listanimation/testanim2.dart';
import 'package:flutter_dojo/common/demo_item.dart';

class AnimationMainPageListItem extends StatefulWidget {
  final DemoItemCategory demoItem;

  AnimationMainPageListItem(this.demoItem);

  @override
  _AnimationMainPageListItemState createState() => _AnimationMainPageListItemState();
}

class _AnimationMainPageListItemState extends State<AnimationMainPageListItem> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1))..forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        child: AnimCategoryContainer(
          CategoryBean(
            Icons.directions_bike,
            widget.demoItem.name,
            widget.demoItem.list.map((v) {
              return CategoryBean(Icons.missed_video_call, v.title, [], () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: v.buildRoute),
                );
              });
            }).toList(),
            () {},
          ),
        ),
      ),
    );
  }
}
