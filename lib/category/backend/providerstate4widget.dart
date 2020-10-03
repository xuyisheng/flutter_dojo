import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ProviderState4Widget extends StatefulWidget {
  @override
  _ProviderState4WidgetState createState() => _ProviderState4WidgetState();
}

class _ProviderState4WidgetState extends State<ProviderState4Widget> {
  DataModel data = DataModel();
  int pageIndex = 0;
  int checkedCount = 0;

  @override
  void initState() {
    data.getData(pageIndex).then((value) {
      setState(() => data.dataList = value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Provider')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MainTitleWidget('刷新 加载更多 收藏'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() => data.dataList.clear());
                    data.getData(0).then((value) {
                      setState(() => data.dataList = value);
                    });
                  },
                  child: Text('Refresh'),
                ),
                RaisedButton(
                  onPressed: () {
                    data.getData(++pageIndex).then((value) {
                      setState(() => data.dataList = value);
                    });
                  },
                  child: Text('Load More'),
                ),
                Text('Checked Count $checkedCount'),
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
                                Checkbox(
                                    value: itemModel.isCheck,
                                    onChanged: (flag) {
                                      setState(() {
                                        var isCheck = itemModel.isCheck;
                                        if (isCheck) {
                                          checkedCount--;
                                        } else {
                                          checkedCount++;
                                        }
                                        return itemModel.isCheck = !isCheck;
                                      });
                                    }),
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
  String title;
  bool isCheck;
  int likeCount;

  ItemModel(this.title, this.isCheck, this.likeCount);
}

class DataModel {
  List<ItemModel> dataList = List();

  Future<List<ItemModel>> getData(int pageIndex) async {
    List<ItemModel> items = await api.getListDataOfIndex(pageIndex);
    dataList.addAll(items);
    return dataList;
  }
}

class API {
  Future<List<ItemModel>> getListDataOfIndex(int pageIndex) async {
    List<ItemModel> data = List();
    await Future.delayed(Duration(seconds: 3));
    List.generate(
      10,
      (index) => (data.add(ItemModel('Title $index  @Page $pageIndex', false, Random().nextInt(20) + 1))),
    );
    return data;
  }
}

var api = API();
