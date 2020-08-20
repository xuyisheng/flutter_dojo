import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class ChipWidget extends StatefulWidget {
  @override
  _ChipWidgetState createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  Color color = Colors.red;
  String selected = '';
  List<String> filters = <String>[];
  List<String> inputs = <String>['S', 'SS', 'SSS'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('RawChip'),
        Wrap(
          spacing: 8,
          children: [
            RawChip(
              label: Text('XuYisheng'),
              labelStyle: TextStyle(color: Colors.blue),
              labelPadding: EdgeInsets.symmetric(horizontal: 8),
            ),
            RawChip(
              label: Text('XuYisheng'),
              onDeleted: () {},
              deleteIcon: Icon(Icons.delete),
              deleteIconColor: Colors.red,
              deleteButtonTooltipMessage: 'Del',
            ),
            RawChip(
              label: Text('XuYisheng'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 8),
            ),
          ],
        ),
        MainTitleWidget('Chip基本用法'),
        Chip(
          padding: EdgeInsets.only(
            right: 20,
          ),
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              'T',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          label: Text(
            'Chip label',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          backgroundColor: Colors.red,
          labelPadding: EdgeInsets.all(8),
        ),
        MainTitleWidget('Chip Icon'),
        Chip(
          //头像
          avatar: CircleAvatar(
            child: Icon(
              Icons.accessibility,
              color: Colors.red,
            ),
            backgroundColor: Colors.white,
          ),
          //设置widget背景颜色
          backgroundColor: Colors.red,
          //剪辑窗口widget内容
          clipBehavior: Clip.antiAlias,
          //设置padding值
          labelPadding: EdgeInsets.all(8),
          label: Text('Custom chip'),
          //设置onDeleted时候显示的图标
          deleteIcon: Icon(
            Icons.delete,
            color: Colors.white,
            size: 20,
          ),
          onDeleted: () {},
          deleteButtonTooltipMessage: 'Del',
          deleteIconColor: Colors.blueGrey,
          //将最小点击目标大小扩展到48*48px
          materialTapTargetSize: MaterialTapTargetSize.padded,
          padding: EdgeInsets.all(2),
          //修改字体格式
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          // shape: _MyBorder(),
        ),
        MainTitleWidget('Choice Chip'),
        SubtitleWidget(
            'ChipTheme: Applies a chip theme to descendant [RawChip]-based widgets, like [Chip], [InputChip], [ChoiceChip], [FilterChip], and [ActionChip].'),
        ChipTheme(
          data: ChipTheme.of(context).copyWith(backgroundColor: Colors.red.shade800),
          child: ChoiceChip(
            padding: EdgeInsets.only(left: 100, right: 100, top: 10, bottom: 10),
            label: Text('down'),
            labelStyle: TextStyle(color: Colors.white),
            onSelected: (bool value) {
              setState(() {
                color = value ? Colors.lightBlue : Colors.red;
              });
            },
            selected: color == Colors.lightBlue,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ChoiceChip(
              avatar: Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
              backgroundColor: Colors.red,
              disabledColor: Colors.blue,
              label: Text('Java'),
              labelStyle: TextStyle(
                fontSize: 15,
              ),
              labelPadding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              onSelected: (value) {
                setState(() {
                  selected = value ? 'Java' : 'Dart';
                });
              },
              selected: selected == 'Java',
            ),
            ChoiceChip(
              avatar: Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
              backgroundColor: Colors.red,
              disabledColor: Colors.blue,
              label: Text('Swift'),
              labelStyle: TextStyle(
                fontSize: 15,
              ),
              labelPadding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              onSelected: (value) {
                setState(() {
                  selected = value ? 'Swift' : 'Dart';
                });
              },
              selected: selected == 'Swift',
            )
          ],
        ),
        MainTitleWidget('Filter Chip'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FilterChip(
              avatar: CircleAvatar(
                child: Text('T'),
              ),
              label: Text('S'),
              selected: filters.contains('S'),
              onSelected: (bool value) {
                setState(() {
                  if (value) {
                    filters.add('S');
                  } else {
                    filters.retainWhere((String name) {
                      return name != 'S';
                    });
                  }
                });
              },
            ),
            FilterChip(
              avatar: CircleAvatar(
                child: Text('T'),
              ),
              label: Text('SS'),
              selected: filters.contains('SS'),
              onSelected: (bool value) {
                setState(() {
                  if (value) {
                    filters.add('SS');
                  } else {
                    filters.retainWhere((String name) {
                      return name != 'SS';
                    });
                  }
                });
              },
            ),
            FilterChip(
              avatar: CircleAvatar(
                child: Text('T'),
              ),
              label: Text('SSS'),
              selected: filters.contains('SSS'),
              onSelected: (bool value) {
                setState(() {
                  if (value) {
                    filters.add('SSS');
                  } else {
                    filters.retainWhere((String name) {
                      return name != 'SSS';
                    });
                  }
                });
              },
            ),
            Text('Choose: ${filters.join(',')}')
          ],
        ),
        MainTitleWidget('Input Chip'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: inputs.map((value) {
            return InputChip(
              avatar: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text('T'),
              ),
              label: Text(value),
              onDeleted: () {
                setState(() {
                  inputs.remove(value);
                });
              },
            );
          }).toList(),
        ),
        MainTitleWidget('ActionChip'),
        ActionChip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Text('X'),
          ),
          label: Text('XuYisheng'),
          onPressed: () {},
        ),
      ],
    );
  }
}
