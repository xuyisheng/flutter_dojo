import 'dart:collection';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/demo_item.dart';
import 'package:flutter_dojo/modle/animation/animation_category.dart';
import 'package:flutter_dojo/modle/backend/backend_category.dart';
import 'package:flutter_dojo/modle/pattern/pattern_category.dart';
import 'package:flutter_dojo/modle/widget/widget_category.dart';
import 'package:flutter_dojo/search/search_strategy.dart';
import 'package:flutter_dojo/search/search_utils.dart';

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
//    SearchUtils().updateWords(); //把字典加入搜索工具中
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
    result = searchUtils.searchInStrategy(
        MultiPositionSearchStrategy(), input.split(KEY_SPLIT));
    bufferTitle = List();
    result.forEach((item) {
      var textItem = getItem(item);
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

  List<String> bufferTitle = List();//多个关键字可能会出现重复的demoItem，用这个list去掉重复的title保证demoItem的唯一性

  getItem(String s) {
    //对title和subtitle做判空处理，防止这两个字段漏写造成闪退
    var title = searchMap[s]?.title != null
        ? searchMap[s]?.title
        : searchMap[s]?.keyword;
    var subtitle = searchMap[s]?.subtitle != null ? searchMap[s]?.subtitle : "";
    //缓存已经显示出来的title去重
    if (bufferTitle.contains(title)) {
      return;
    } else {
      bufferTitle.add(title);
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: Row(
          children: <Widget>[
            Icon(searchMap[s]?.icon),
            Container(
              margin: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 70,
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 70,
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: searchMap[s]?.buildRoute));
      },
    );
  }
}
