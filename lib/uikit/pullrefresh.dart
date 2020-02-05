import 'dart:async';

import 'package:flutter/material.dart';

class PullRefreshWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PullRefreshLayout();
  }
}

enum RefreshState {
  IDLE, // 正常情况
  PULL_DOWN, // 下拉
  RELEASE_TO_REFRESH, // 下拉后释放刷新
  ON_REFRESH, // 下拉后开始刷新
  COMPLETE_ON_REFRESH, // 下拉刷新完成
  PULL_UP, // 上拉
  RELEASE_TO_LOAD_MORE, // 上拉后释放加载更多
  ON_LOAD_MORE, // 上拉后开始加载更多
  COMPLETE_ON_LOAD_MORE // 上拉加载完成
}

enum Direction {
  IDLE, // 无拖动
  UP, // 上拉
  DOWN // 下拉
}

class PullRefreshLayout extends StatefulWidget {
  @override
  _PullRefreshLayoutState createState() => _PullRefreshLayoutState();
}

class _PullRefreshLayoutState extends State<PullRefreshLayout> with TickerProviderStateMixin {
  // 最大下拉上拉距离
  final double maxScrollDistance = 150;

  // 刷新Widget高度，同样也是触发刷新的最小高度
  final double refreshWidgetHeight = 50;

  // 滑动偏移量
  Offset scrollOffset = Offset.zero;

  // 当前状态
  RefreshState currentState = RefreshState.IDLE;

  ScrollController scrollController = ScrollController();

  // 当前动作
  Direction get currentDirection {
    if (scrollOffset.dy > 0) {
      return Direction.DOWN;
    } else if (scrollOffset.dy < 0) {
      return Direction.UP;
    } else {
      return Direction.IDLE;
    }
  }

  Animation<double> scrollAnimation;
  AnimationController scrollAnimController;

  // 数据源
  List<String> dataList;

  @override
  void initState() {
    super.initState();
    scrollAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    loadData().then((List<String> value) {
      setState(() {
        dataList = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollAnimController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 下拉时，刷新Widget显示，加载更多Widget隐藏
    double refreshWidgetHeight = currentDirection == Direction.DOWN ? scrollOffset.dy : 0;
    // 上拉时，刷新Widget隐藏，加载更多Widget显示
    double loadMoreWidgetHeight = currentDirection == Direction.UP ? scrollOffset.dy.abs() : 0;

    var refreshWidget = Stack(
      children: <Widget>[
        buildRefreshHeadItem(context, refreshWidgetHeight),
        Transform.translate(
          offset: scrollOffset,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              return handleScrollEvent(notification);
            },
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(color: Colors.grey),
              child: ListView.builder(
                itemCount: dataList?.length ?? 0,
                itemBuilder: buildListItem,
              ),
            ),
          ),
        ),
        buildRefreshBottomItem(context, loadMoreWidgetHeight),
      ],
    );
    return Center(child: dataList == null ? CircularProgressIndicator() : refreshWidget);
  }

  /// 构建列表数据项
  Widget buildListItem(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(color: Colors.lightBlueAccent),
      margin: EdgeInsets.all(4),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        title: Text(dataList != null ? dataList[index] : ''),
      ),
    );
  }

  ///构建顶部刷新Widget
  Widget buildRefreshHeadItem(BuildContext context, double height) {
    return Container(
      color: Colors.yellow,
      height: height,
      alignment: Alignment.center,
      child: Text(getShowText()),
    );
  }

  /// 构建底部加载Widget
  Widget buildRefreshBottomItem(BuildContext context, double height) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.blue,
        height: height,
        alignment: Alignment.center,
        child: Text(getShowText()),
      ),
    );
  }

  /// 处理滚动事件
  bool handleScrollEvent(ScrollNotification notification) {
    if (notification.depth != 0 || scrollAnimController.isAnimating) {
      return false;
    }
    // 处理顶部下拉刷新和底部上拉加载更多
    if (notification is OverscrollNotification) {
      handleOverScroll(notification);
      debugPrint('Overscroll dy: ${notification?.dragDetails?.delta?.dy}');
    }
    if (notification is ScrollStartNotification) {
      debugPrint('ScrollStart');
    }
    // 处理松手后的行为
    if (notification is ScrollEndNotification) {
      handleEndScroll(notification);
      debugPrint('ScrollEnd');
    }
    if (notification is ScrollUpdateNotification) {
      debugPrint('ScrollUpdate dy: ${notification.dragDetails.delta.dy}');
    }
    return true;
  }

  /// 处理顶部底部下拉上拉事件
  void handleOverScroll(OverscrollNotification notification) {
    if (notification.velocity == 0) {
      // 手动触发OverScroll则velocity为0
      setState(() {
        // 改变scrollOffset来实现下拉上拉偏移
        var translateY = notification?.dragDetails?.delta?.dy;
        // 指定拉动的最大值
        if (scrollOffset.dy.abs() > maxScrollDistance) {
          translateY = 0;
        }
        scrollOffset = scrollOffset.translate(0, translateY);
        updateRefreshState();
      });
    }
  }

  /// 处理松手后的事件
  void handleEndScroll(ScrollEndNotification notification) {
    if (currentState == RefreshState.PULL_DOWN ||
        currentState == RefreshState.PULL_UP ||
        currentState == RefreshState.ON_REFRESH ||
        currentState == RefreshState.ON_LOAD_MORE ||
        currentState == RefreshState.RELEASE_TO_REFRESH ||
        currentState == RefreshState.RELEASE_TO_LOAD_MORE) {
      if (scrollOffset.dy.abs() < refreshWidgetHeight) {
        // 小于最小刷新高度则直接回弹
        animAutoScrollBackToNormal();
      } else {
        // 大于最小高度则执行刷新
        handleRefresh();
      }
    }
  }

  /// 处理刷新动作
  void handleRefresh() {
    animShowRefresh();
    updateRefreshState();
    Future<List<String>> result;
    if (currentDirection == Direction.DOWN) {
      currentState = RefreshState.ON_REFRESH;
      result = refresh();
    } else {
      currentState = RefreshState.ON_LOAD_MORE;
      result = loadMore();
    }
    if (result != null) {
      result.then((List<String> list) {
        if (currentDirection == Direction.DOWN) {
          dataList.insertAll(0, list);
          currentState = RefreshState.COMPLETE_ON_REFRESH;
        } else {
          dataList.addAll(list);
          currentState = RefreshState.COMPLETE_ON_LOAD_MORE;
        }
        animAutoScrollBackToNormal();
      });
    }
  }

  /// 回弹动画
  void animAutoScrollBackToNormal() {
    scrollAnimation?.removeListener(scrollAnimListener);
    scrollAnimController.reset();
    scrollAnimation = scrollAnimController.drive(
      Tween<double>(
        begin: scrollOffset.dy,
        end: 0,
      ),
    );
    scrollAnimation.addListener(scrollAnimListener);
    scrollAnimController.forward();
  }

  /// 刷新动画
  void animShowRefresh() {
    scrollAnimation?.removeListener(scrollAnimListener);
    scrollAnimController.reset();
    scrollAnimation = scrollAnimController.drive(
      Tween<double>(
        begin: scrollOffset.dy,
        end: currentDirection == Direction.DOWN ? refreshWidgetHeight : -refreshWidgetHeight,
      ),
    );
    scrollAnimation.addListener(scrollAnimListener);
    scrollAnimController.forward();
  }

  /// 动画返回值监听处理
  void scrollAnimListener() {
    setState(() {
      scrollOffset = Offset(0, scrollAnimation.value);
      if (scrollOffset.dy == 0) {
        currentState = RefreshState.IDLE;
      }
      debugPrint('=====${scrollAnimation.value}');
    });
  }

  /// 更新状态
  void updateRefreshState() {
    if (currentDirection == Direction.DOWN) {
      if (scrollOffset.dy > refreshWidgetHeight) {
        currentState = RefreshState.RELEASE_TO_REFRESH;
      } else {
        currentState = RefreshState.PULL_DOWN;
      }
    } else if (currentDirection == Direction.UP) {
      if (scrollOffset.dy.abs() > refreshWidgetHeight) {
        currentState = RefreshState.RELEASE_TO_LOAD_MORE;
      } else {
        currentState = RefreshState.PULL_UP;
      }
    }
  }

  /// 加载数据
  Future<List<String>> loadData() async {
    return await Future.delayed(Duration(seconds: 2), () => List.generate(10, (index) => 'item -- $index'));
  }

  /// 加载更多数据
  Future<List<String>> loadMore() async {
    return await Future.delayed(Duration(seconds: 2), () => List.generate(5, (index) => 'add more item'));
  }

  /// 加载刷新数据
  Future<List<String>> refresh() async {
    return await Future.delayed(Duration(seconds: 2), () => List.generate(5, (index) => 'refresh item'));
  }

  /// 根据状态显示不同的刷新、加载文案
  String getShowText() {
    if (currentState == RefreshState.PULL_DOWN) {
      return '下拉刷新';
    } else if (currentState == RefreshState.PULL_UP) {
      return '上拉加载';
    } else if (currentState == RefreshState.RELEASE_TO_REFRESH) {
      return '释放刷新';
    } else if (currentState == RefreshState.RELEASE_TO_LOAD_MORE) {
      return '释放加载';
    } else if (currentState == RefreshState.ON_REFRESH) {
      return '刷新中';
    } else if (currentState == RefreshState.ON_LOAD_MORE) {
      return '加载中';
    }
    return '';
  }
}

/// 加载更多的另一种实现
class AutoLoadMoreLayout extends StatefulWidget {
  @override
  _AutoLoadMoreLayoutState createState() => _AutoLoadMoreLayoutState();
}

class _AutoLoadMoreLayoutState extends State<AutoLoadMoreLayout> {
  List<int> data = List.generate(20, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length + 1,
          itemBuilder: (context, index) {
            if (index == data.length) {
              if (data.length > 30) {
                return Center(
                  child: Text('Done'),
                );
              } else {
                getMoreData().then((List<int> value) {
                  setState(() {
                    data.addAll(value);
                  });
                });
              }
              return buildLoadingProgress();
            }
            return ListTile(
              title: Text('Item $index'),
            );
          }),
    );
  }

  buildLoadingProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Future<List<int>> getMoreData() async {
    return await Future.delayed(Duration(milliseconds: 3000), () {
      return List.generate(3, (index) => index);
    });
  }
}
