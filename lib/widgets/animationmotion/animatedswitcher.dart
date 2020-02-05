import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/item_util.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  @override
  _AnimatedSwitcherWidgetState createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
  Widget switchWidget = SizedItem(100);
  int _count = 0;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('AnimatedSwitcher基本使用'),
        SubtitleWidget('使用UniqueKey区分不同的Widget，使AnimatedSwitcher生效'),
        AnimatedSwitcher(
            child: isVisible
                ? Container(
                    key: UniqueKey(),
                    height: 100.0,
                    width: 100.0,
                    color: Colors.red,
                  )
                : Container(
                    key: UniqueKey(),
                    height: 100.0,
                    width: 100.0,
                    color: Colors.blue,
                  ),
            duration: Duration(seconds: 2)),
        RaisedButton(
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          child: Text('Switch'),
        ),
        SubtitleWidget('组件切换的时候使用自定义动画效果'),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 2000),
          child: switchWidget,
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
        ),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 2000),
          child: switchWidget,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ClipRect(
              child: SlideTransition(
                position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(animation),
                child: child,
              ),
            );
          },
        ),
        RaisedButton(
          onPressed: () {
            setState(() => switchWidget = Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ));
          },
          child: Text('Switch'),
        ),
        MainTitleWidget('自定义AnimatedSwitcher'),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: Text(
            '$_count',
            key: ValueKey<int>(_count),
            style: Theme.of(context).textTheme.display1,
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            final inAnimation = Tween<Offset>(
              begin: Offset(1.0, 0.0),
              end: Offset(0.0, 0.0),
            ).animate(animation);
            final outAnimation = Tween<Offset>(
              begin: Offset(-1.0, 0.0),
              end: Offset(0.0, 0.0),
            ).animate(animation);
            if (child.key == ValueKey(_count)) {
              return ClipRect(
                child: SlideTransition(
                  position: inAnimation,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: child,
                  ),
                ),
              );
            } else {
              return ClipRect(
                child: SlideTransition(
                  position: outAnimation,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: child,
                  ),
                ),
              );
            }
          },
          child: Text(
            '$_count',
            key: ValueKey<int>(_count), // 如果变更的组件 不是同一个组件, 或者是不同的state 或者是不同的显示数据与状态 则需要为当前组件每一个状态加入一个Key 强制生效动画效果
            style: Theme.of(context).textTheme.display4,
          ),
        ),
        RaisedButton(
          child: const Text('Increment'),
          onPressed: () {
            setState(() => _count += 1);
          },
        ),
      ],
    );
  }
}
