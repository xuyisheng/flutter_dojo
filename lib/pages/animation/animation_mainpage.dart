import 'package:flutter/material.dart';
import 'package:flutter_dojo/modle/animation/animation_category.dart';

import 'animation_mainpage_list_item.dart';

class AnimationMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00BCD4),
        elevation: 0,
        title: Text('Animation Main List'),
      ),
      body: Container(
        color: Color(0xFF00BCD4),
        child: ListView.builder(
          itemBuilder: (context, index) {
            var itemCategory = buildAnimationCategoryList[index];
            return AnimationMainPageListItem(itemCategory);
          },
          itemCount: buildAnimationCategoryList.length,
        ),
      ),
    );
  }
}
