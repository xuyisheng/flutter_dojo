import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  List list1 = ['Option Item A', 'Option Item B', 'Option Item C'];
  String selection = 'None';
  List list2 = ["Item1", "Item2", "Item3", "Item4"];
  List icons = [Icons.add, Icons.cached, Icons.vibration, Icons.backup];
  var bottomSheetController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MainTitleWidget('BottomSheet基本使用'),
        RaisedButton(
          onPressed: _openShowBottomSheet,
          child: Text(
            'showBottomSheet',
            style: TextStyle(fontSize: 16),
          ),
        ),
        RaisedButton(
          onPressed: () {
            if (bottomSheetController != null) {
              bottomSheetController.close();
            }
          },
          child: Text(
            'Close bottomSheet',
            style: TextStyle(fontSize: 16),
          ),
        ),
        RaisedButton(
          onPressed: _openShowModalBottomSheet,
          child: Text(
            'showModalBottomSheet: $selection',
            style: TextStyle(fontSize: 16),
          ),
        ),
        RaisedButton(
          onPressed: _openShowRoundModalBottomSheet,
          child: Text(
            'show round corner',
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }

  Future _openShowModalBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child: ListView(
              children: List.generate(3, (index) {
                return ListTile(
                  title: Text(list1[index]),
                  onTap: () {
                    Navigator.pop(context, list1[index]);
                  },
                );
              }),
            ),
          );
        });
    setState(() {
      selection = option;
    });
  }

  Future _openShowRoundModalBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        backgroundColor: Colors.blue,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child: ListView(
              children: List.generate(3, (index) {
                return ListTile(
                  title: Text(list1[index]),
                  onTap: () {
                    Navigator.pop(context, list1[index]);
                  },
                );
              }),
            ),
          );
        });
    setState(() {
      selection = option;
    });
  }

  Future _openShowBottomSheet() async {
    bottomSheetController = showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.grey,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: List.generate(4, (index) {
                return ListTile(
                  leading: Icon(icons[index]),
                  title: Text(list2[index]),
                  onTap: () {
                    Navigator.pop(context, list2[index]);
                  },
                );
              }),
            ),
          ),
        );
      },
    ).closed.whenComplete(() {
      setState(() => bottomSheetController = null);
    });
  }
}
