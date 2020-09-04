import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ProviderState2Widget extends StatefulWidget {
  @override
  _ProviderState2WidgetState createState() => _ProviderState2WidgetState();
}

class _ProviderState2WidgetState extends State<ProviderState2Widget> {
  DataModel data = DataModel();
  int pageIndex = 0;

  @override
  void initState() {
    data.getData(pageIndex).then((value) {
      setState(() => data = value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MainTitleWidget('title'),
            Row(
              children: [
                RaisedButton(
                  onPressed: () {},
                  child: Text('Refresh'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Load More'),
                ),
                Text('Checked'),
              ],
            ),
            Expanded(
              child: data.dataList.length > 0
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        var itemModel = data.dataList[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Checkbox(value: itemModel.isCheck, onChanged: (flag) {}),
                                Text(itemModel.title),
                                Spacer(),
                                Icon(Icons.favorite),
                                ConstrainedBox(
                                  constraints: BoxConstraints(minWidth: 30),
                                  child: Center(child: Text(itemModel.likeCount.toString())),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: data.dataList.length,
                    )
                  : Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemModel {
  final String title;
  final bool isCheck;
  final int likeCount;

  ItemModel(this.title, this.isCheck, this.likeCount);
}

class DataModel {
  List<ItemModel> dataList = List();
  int pageIndex = 0;

  getData(int pageIndex) async {
    List<ItemModel> items = await api.getListDataOfIndex(pageIndex);
    dataList.addAll(items);
  }
}

class API {
  Future<List<ItemModel>> getListDataOfIndex(int pageIndex) async {
    List<ItemModel> data = List();
    Future.delayed(Duration(seconds: 2));
    List.generate(10, (index) => (data.add(ItemModel('title $index Page $pageIndex', false, Random().nextInt(20) + 1))));
    return data;
  }
}

var api = API();
