import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/modle/pattern/pattern_category.dart';

import 'pattern_mainpage_root_item.dart';

class PatternMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF736AB7),
        elevation: 0,
        title: Text('Pattern Main List'),
      ),
      body: Container(
        color: Color(0xFF736AB7),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) => PatternMainPageListItem(buildPatternData[index]),
          itemCount: buildPatternData.length,
        ),
      ),
    );
  }
}

class Entry {
  final String title;
  final List<DemoItem> children;

  Entry(this.title, this.children);
}
