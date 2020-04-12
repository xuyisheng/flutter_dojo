import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';
import 'package:flutter_dojo/common/single_selection_item.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  @override
  _FloatingActionButtonWidgetState createState() => _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState extends State<FloatingActionButtonWidget> {
  var fabLocation = FloatingActionButtonLocation.endTop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('FAB'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(
          height: 50,
        ),
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonLocation: fabLocation,
      body: ListView(
        children: <Widget>[
          MainTitleWidget('FAB Location'),
          MultiSelectionWidget('', [
            FloatingActionButtonLocation.centerDocked,
            FloatingActionButtonLocation.centerFloat,
            FloatingActionButtonLocation.endDocked,
            FloatingActionButtonLocation.endFloat,
            FloatingActionButtonLocation.endTop,
            FloatingActionButtonLocation.miniStartTop,
            FloatingActionButtonLocation.startTop,
          ], [
            'centerDocked',
            'centerFloat',
            'endDocked',
            'endFloat',
            'endTop',
            'miniStartTop',
            'startTop',
          ], (value) {
            setState(() => fabLocation = value);
          }),
          MainTitleWidget('Normal FAB'),
          FloatingActionButton(
            // 子视图，一般为Icon，不推荐使用文字
            child: const Icon(Icons.add),
            // FAB的文字解释，FAB被长按时显示，也是无障碍功能
            tooltip: 'show tooltip',
            // 前景色
            foregroundColor: Colors.white,
            // 背景色
            backgroundColor: Colors.cyan,
            // hero效果使用的tag,系统默认会给所有FAB使用同一个tag,方便做动画效果,简单理解为两个界面内拥有同样tag的元素在界面切换过程中，会有动画效果，是界面切换不再那么生硬。
            heroTag: null,
            // 未点击时阴影值，默认6.0
            elevation: 7.0,
            // 点击时阴影值，默认12.0
            highlightElevation: 14.0,
            // 点击事件回调
            onPressed: () {},
            // 是否为“mini”类型，默认为false,FAB 分为三种类型：regular, mini, and extended
            mini: false,
            // 定义FAB的shape，设置shape时，默认的elevation将会失效,默认为CircleBorder
            //shape: CircleBorder(),
            shape: CircleBorder(),
            // 是否为”extended”类型
            isExtended: true,
          ),
          MainTitleWidget('Extended FAB'),
          FloatingActionButton.extended(
            onPressed: () {},
            heroTag: null,
            foregroundColor: Colors.white,
            backgroundColor: Colors.amber,
            //如果不手动设置icon和text颜色,则默认使用foregroundColor颜色
            icon: Icon(Icons.slideshow, color: Colors.red),
            label: Text('FloatingActionButton.extended', maxLines: 1),
          ),
        ],
      ),
    );
  }
}

const SelectionValue<FloatingActionButtonLocation> fabLocationEndDocked =
    SelectionValue(FloatingActionButtonLocation.endDocked, 'endDocked', 'endDocked');
const SelectionValue<FloatingActionButtonLocation> fabLocationCenterDocked =
    SelectionValue(FloatingActionButtonLocation.centerDocked, 'centerDocked', 'centerDocked');
const SelectionValue<FloatingActionButtonLocation> fabLocationCenterFloat =
    SelectionValue(FloatingActionButtonLocation.centerFloat, 'centerFloat', 'centerFloat');
const SelectionValue<FloatingActionButtonLocation> fabLocationEndFloat =
    SelectionValue(FloatingActionButtonLocation.endFloat, 'endFloat', 'endFloat');
const SelectionValue<FloatingActionButtonLocation> fabLocationMiniStartTop =
    SelectionValue(FloatingActionButtonLocation.miniStartTop, 'miniStartTop', 'miniStartTop');
const SelectionValue<FloatingActionButtonLocation> fabLocationStartTop =
    SelectionValue(FloatingActionButtonLocation.startTop, 'startTop', 'startTop');
