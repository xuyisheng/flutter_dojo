import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ExpansionPanelWidget extends StatefulWidget {
  @override
  _ExpansionPanelWidgetState createState() => _ExpansionPanelWidgetState();
}

class _ExpansionPanelWidgetState extends State<ExpansionPanelWidget> {
  List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('ExpansionPanel基本使用'),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: buildPanel(),
        ),
      ],
    );
  }

  Widget buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          canTapOnHeader: true,
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle: Text('Click to delete'),
              trailing: Icon(Icons.delete),
              onTap: () => setState(() => _data.removeWhere((currentItem) => item == currentItem))),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'ExpansionPanel $index',
      expandedValue: 'item $index',
    );
  });
}
