import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/pages/widget/widget_category_demo_list_item.dart';

class WidgetCategoryDemoList extends StatelessWidget {
  final List<DemoItem> demoList;
  final String name;

  WidgetCategoryDemoList(this.demoList, this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Color.fromARGB(255, 54, 55, 70),
        elevation: 0,
      ),
      body: Container(
        color: Color.fromARGB(255, 54, 55, 70),
        child: ListView.builder(
          itemBuilder: (context, index) {
            var demo = demoList[index];
            return WidgetCategoryDemoListItem(demo.title, demo.subtitle, demo.icon, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: demo.buildRoute),
              );
            });
          },
          itemCount: demoList.length,
        ),
      ),
    );
  }
}
