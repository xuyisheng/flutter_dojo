import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class DismissibleWidget extends StatefulWidget {
  @override
  _DismissibleWidgetState createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {
  List<String> items = List.generate(10, (index) => "item $index");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Dismissible基本使用'),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(items[index]),
                child: ListTile(
                  title: Text(items[index]),
                ),
                onDismissed: (direction) {
                  setState(() {
                    items.removeAt(index);
                  });
                },
                background: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.blue,
                  child: Icon(Icons.check),
                ),
                secondaryBackground: Container(
                  alignment: Alignment.centerRight,
                  color: Colors.green,
                  child: Icon(Icons.cancel),
                ),
              );
            },
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}
