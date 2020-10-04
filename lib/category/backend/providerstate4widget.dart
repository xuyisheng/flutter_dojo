import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:provider/provider.dart';

class ProviderState4Widget extends StatefulWidget {
  @override
  _ProviderState4WidgetState createState() => _ProviderState4WidgetState();
}

class _ProviderState4WidgetState extends State<ProviderState4Widget> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Provider')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ChangeNotifierProvider(
          create: (BuildContext context) {
            var model = DataModel();
            model.getData(pageIndex);
            return model;
          },
          child: Column(
            children: [
              MainTitleWidget('刷新 加载更多 收藏'),
              Builder(
                builder: (BuildContext context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          var model = Provider.of<DataModel>(context, listen: false);
                          model.refreshData();
                          model.getData(0);
                        },
                        child: Text('Refresh'),
                      ),
                      RaisedButton(
                        onPressed: () {
                          context.read<DataModel>().getData(++pageIndex);
                        },
                        child: Text('Load More'),
                      ),
                      Text('Checked Count ${context.watch<DataModel>().checkedCount}'),
                    ],
                  );
                },
              ),
              Expanded(
                child: Selector<DataModel, DataModel>(
                  shouldRebuild: (pre, next) => pre.shouldListRebuild,
                  selector: (context, dataModel) => dataModel,
                  builder: (BuildContext context, DataModel dataModel, Widget child) {
                    if (dataModel.dataList.length > 0) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Selector<DataModel, ItemModel>(
                            selector: (context, value) => value.dataList[index],
                            builder: (BuildContext context, data, Widget child) {
                              debugPrint(('Item $index rebuild'));
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          value: data.isCheck,
                                          onChanged: (flag) {
                                            dataModel.updateChecked(index, !data.isCheck);
                                          }),
                                      Text(data.title),
                                      Spacer(),
                                      Icon(Icons.favorite),
                                      ConstrainedBox(
                                        constraints: BoxConstraints(minWidth: 30),
                                        child: Center(child: Text(data.likeCount.toString())),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        itemCount: dataModel.dataList.length,
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
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

class DataModel with ChangeNotifier {
  List<ItemModel> dataList = List();
  int checkedCount = 0;
  bool shouldListRebuild = true;

  getData(int pageIndex) async {
    List<ItemModel> items = await api.getListDataOfIndex(pageIndex);
    shouldListRebuild = true;
    dataList.addAll(items);
    notifyListeners();
  }

  refreshData() {
    dataList.clear();
    checkedCount = 0;
    shouldListRebuild = true;
    notifyListeners();
  }

  updateChecked(int index, bool isChecked) {
    shouldListRebuild = false;
    var item = dataList[index];
    if (isChecked) {
      checkedCount++;
    } else {
      checkedCount--;
    }
    dataList[index] = ItemModel(item.title, isChecked, item.likeCount);
    notifyListeners();
  }
}

class API {
  Future<List<ItemModel>> getListDataOfIndex(int pageIndex) async {
    List<ItemModel> data = List();
    await Future.delayed(Duration(seconds: 2));
    List.generate(
      10,
      (index) => (data.add(ItemModel('Title $index  @Page $pageIndex', false, Random().nextInt(20) + 1))),
    );
    return data;
  }
}

var api = API();
