import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class DropdownButtonWidget extends StatefulWidget {
  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  List<DropdownMenuItem> generateItemList() {
    final List<DropdownMenuItem> items = List();
    final DropdownMenuItem item1 = DropdownMenuItem(value: 'android', child: Text('Android'));
    final DropdownMenuItem item2 = DropdownMenuItem(value: 'iOS', child: Text('iOS'));
    final DropdownMenuItem item3 = DropdownMenuItem(value: 'java', child: Text('Java'));
    items.add(item1);
    items.add(item2);
    items.add(item3);
    return items;
  }

  var selectValue;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('DropdownButton基本用法'),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton(
              hint: Text('DropdownButton choose a item'),
              value: selectValue,
              items: generateItemList(),
              onChanged: (value) {
                setState(() => selectValue = value);
              },
            ),
          ],
        ),
        MainTitleWidget('Custom DropdownButton'),
        DropdownButton(
          hint: Text('DropdownButton choose a item'),
          value: selectValue,
          items: generateItemList(),
          onChanged: (value) {
            setState(() => selectValue = value);
          },
          elevation: 24,
          style: TextStyle(
            //设置文本框里面文字的样式
            color: Colors.indigoAccent,
          ),
          //减少按钮的高度。默认情况下，此按钮的高度与其菜单项的高度相同。如果isDense为true，则按钮的高度减少约一半。 这个当按钮嵌入添加的容器中时，非常有用
          // isDense: true,
          // 将下拉列表的内部内容设置为水平填充其父级
          isExpanded: true,
          iconSize: 50.0, //设置三角标icon的大小
        ),
        MainTitleWidget('无下边线的DropdownButton'),
        DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Text('DropdownButton choose a item'),
            value: selectValue,
            items: generateItemList(),
            onChanged: (value) {
              setState(() => selectValue = value);
            },
          ),
        ),
      ],
    );
  }
}
