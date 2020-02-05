import 'package:flutter/material.dart';
import 'package:flutter_dojo/modle/widget/widget_category.dart';

import 'widget_category_demo_list.dart';
import 'widget_mainpage_list_item.dart';

class WidgetMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets'),
        backgroundColor: Color(0xFF736AB7),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFF736AB7),
        child: ListView.builder(
          itemBuilder: (context, index) {
            var itemCategory = buildWidgetCategoryList[index];
            return WidgetMainPageListItem(
              itemCategory.name,
              itemCategory.subName,
              itemCategory.icon,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WidgetCategoryDemoList(itemCategory.list, itemCategory.name),
                  ),
                );
              },
            );
          },
          itemCount: buildWidgetCategoryList.length,
        ),
      ),
    );
  }
}
