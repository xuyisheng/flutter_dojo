import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/modle/backend/backend_category.dart';
import 'package:flutter_dojo/search/search_utils.dart';

class SearchMainPage extends StatefulWidget {
  @override
  SearchState createState() {
    return SearchState();
  }
}

class SearchState extends State<SearchMainPage> {
  //测试用数据，后期可以换成map来支持页面跳转
//  List<String> testDictionary = [
//    'Accessibility',
//    'Animation and motion',
//    'Async',
//    'App stucture and navigation',
//    'Assets,images,and icon',
//    'Basic',
//    'Buttons',
//    'Cupertino',
//    'Dialog,alerts,and panels',
//    'Information displays',
//    'Input',
//    'Input and selections',
//    'Layout',
//    'Multu-child layout',
//    'Painting and effet',
//    'Routing',
//    'Scrolling',
//    'Single-child layout widgets',
//    'Styling',
//    'Text',
//    'Touch interactions',
//    'CatchError',
//    'File',
//    'Key',
//    'LifeCycle',
//    'Json',
//    'PageRoute',
//    'Provider',
//    'ProviderState'
//  ];
  List<DemoItem> demoList = buildBackendCategoryList;
  String input = ''; //用户在输入框输入的文字
  Set<String> result; //返回的关键词搜索结果
  TextEditingController _controller = TextEditingController();
  SearchUtils searchUtils = SearchUtils();
  HashMap<String, DemoItem> searchMap = HashMap<String, DemoItem>();

  @override
  void initState() {
    super.initState();
//    SearchUtils().updateWords(); //把字典加入搜索工具中
    demoList.forEach((demoItem) {
      searchUtils.addWord(demoItem.keyword);
      searchMap[demoItem.keyword] = demoItem;
    });
    _controller.addListener(() {
      setState(() {
        input = _controller?.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> textList = new List();

    // defaultSearchStrategy是默认的搜索关键词匹配策略，
    // 也可以用searchSimilarWords匹配相似单词，用searchWordsInTrie匹配前缀，自己设定参数
    // 如果把单词倒过来加入字典，还可以用searchWordsInTrie匹配到后缀
    result = searchUtils.defaultSearchStrategy(input);
    result.forEach((item) {
      textList.add(getItem(item));
    });

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getSearchBar(context),
            Expanded(
              child: ListView.builder(
                itemCount: textList.length,
                itemBuilder: (context, position) {
                  return textList[position];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  getSearchBar(context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.text,
                      controller: _controller,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(
                '返回',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  getItem(String s) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Icon(searchMap[s]?.icon),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                s,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: searchMap[s]?.buildRoute));
        },
      ),
    );
  }
}
