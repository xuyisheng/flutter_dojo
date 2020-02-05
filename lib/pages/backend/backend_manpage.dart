import 'package:flutter/material.dart';
import 'package:flutter_dojo/modle/backend/backend_category.dart';
import 'package:flutter_dojo/pages/backend/backend_mainpage_list_item.dart';

class BackendMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Backend Main List'),
      ),
      body: Container(
        color: Color.fromARGB(255, 239, 239, 239),
        child: ListView.builder(
          itemBuilder: (context, index) {
            var itemCategory = buildBackendCategoryList[index];
            return BackendMainPageListItem(itemCategory);
          },
          itemCount: buildBackendCategoryList.length,
        ),
      ),
    );
  }
}
