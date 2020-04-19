import 'dart:collection';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/modle/animation/animation_category.dart';
import 'package:flutter_dojo/modle/backend/backend_category.dart';
import 'package:flutter_dojo/modle/pattern/pattern_category.dart';
import 'package:flutter_dojo/modle/widget/widget_category.dart';
import 'package:flutter_dojo/pages/search/search_strategy.dart';
import 'package:flutter_dojo/pages/search/search_utils.dart';
import 'package:flutter_dojo/pages/search/searchpageitem.dart';

class SearchMainPage extends StatefulWidget {
  @override
  SearchState createState() {
    return SearchState();
  }
}

class SearchState extends State<SearchMainPage> {
  static const String KEY_SPLIT = ' ';
  List<DemoItem> demoList = [];
  String input = ''; //用户在输入框输入的文字
  Set<String> result; //返回的关键词搜索结果
  TextEditingController _controller = TextEditingController();
  SearchUtils searchUtils = SearchUtils();
  HashMap<String, DemoItem> searchMap = HashMap<String, DemoItem>();

  @override
  void initState() {
    super.initState();
    buildWidgetCategoryList.forEach((value) {
      demoList.addAll(value.list);
    });
    buildPatternData.forEach((value) {
      demoList.addAll(value.list);
    });
    buildAnimationCategoryList.forEach((value) {
      demoList.addAll(value.list);
    });
    demoList.addAll(buildBackendCategoryList);
    demoList.forEach((demoItem) {
      //支持多个keyword用空格分隔
      List<String> splitArray = demoItem.keyword.split(KEY_SPLIT);
      for (String keyword in splitArray) {
        if (keyword.length > 0) {
          searchUtils.addWord(keyword);
          searchMap[keyword] = demoItem;
        }
      }
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
    // SearchStrategy是搜索关键词匹配策略，
    // 也可以用searchSimilarWords匹配相似单词，用searchWordsInTrie匹配前缀，自己设定参数
    result = searchUtils.searchInStrategy(MultiPositionSearchStrategy(), input.split(KEY_SPLIT));
    bufferTitle = List();
    result.forEach((item) {
      var textItem = SearchPageListItem(searchMap[item]);
      if (textItem != null) {
        textList.add(textItem);
      }
    });

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top),
        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getSearchBar(context),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: textList.length,
                  itemBuilder: (context, position) {
                    return textList[position];
                  },
                ),
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
          BackButton(),
          Expanded(
            child: Container(
              height: 48,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'search with keyword',
                        border: UnderlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      controller: _controller,
                    ),
                  ),
                  Visibility(
                    visible: _controller.text.length > 0,
                    child: GestureDetector(
                      child: Icon(
                        Icons.clear,
                      ),
                      onTap: () {
                        _controller.clear();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Hero(
              tag: 'search',
              child: Icon(
                Icons.search,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //多个关键字可能会出现重复的demoItem，用这个list去掉重复的title保证demoItem的唯一性
  List<String> bufferTitle = List();
}
