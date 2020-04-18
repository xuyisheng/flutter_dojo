import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class ExpansionTileWidget extends StatefulWidget {
  @override
  _ExpansionTileWidgetState createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  var selection = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('ExpansionTile基本使用'),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
            itemCount: data.length,
          ),
        ),
        SubtitleWidget('单个实现'),
        Expanded(
          child: ExpansionTile(
            leading: Icon(Icons.star),
            title: Text("My Book"),
            onExpansionChanged: (value) {},
            initiallyExpanded: true,
            children: <Widget>[
              CheckboxListTile(
                value: selection == 0,
                onChanged: (v) {
                  setState(() => selection = 0);
                },
                title: Text('Android群英传'),
              ),
              CheckboxListTile(
                value: selection == 1,
                onChanged: (v) {
                  setState(() => selection = 1);
                },
                title: Text('神兵利器'),
              ),
              CheckboxListTile(
                value: selection == 2,
                onChanged: (v) {
                  setState(() => selection = 2);
                },
                title: Text('修仙指南'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Entry {
  const Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

const List<Entry> data = <Entry>[
  Entry(
    'ExpansionTile A',
    <Entry>[
      Entry(
        'Section a',
        <Entry>[
          Entry('Item A.a.1'),
          Entry('Item A.a.2'),
        ],
      ),
      Entry('Section aa'),
      Entry('Section aaa'),
    ],
  ),
  Entry(
    'ExpansionTile B',
    <Entry>[
      Entry('Section b'),
      Entry('Section bb'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
