import 'package:flutter/material.dart';
import 'package:flutter_dojo/modle/uikit/uikit_category.dart';

import 'uikit_mainpage_list_item.dart';

class UIKitMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UIKit Main List'),
      ),
      body: Container(
        color: Color.fromARGB(255, 239, 239, 239),
        child: ListView.builder(
          itemBuilder: (context, index) {
            var itemCategory = buildUIKitCategoryList[index];
            return UIKitMainPageListItem(itemCategory);
          },
          itemCount: buildUIKitCategoryList.length,
        ),
      ),
    );
  }
}
