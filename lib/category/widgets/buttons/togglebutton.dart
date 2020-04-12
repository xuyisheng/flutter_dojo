import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ToggleButtonWidget extends StatefulWidget {
  @override
  _ToggleButtonWidgetState createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  var selectedList1 = [true, false, false, false];
  var selectedList2 = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('ToggleButton基本使用'),
        ToggleButtons(
          children: [
            Icon(Icons.account_balance),
            Icon(Icons.backup),
            Icon(Icons.calendar_today),
            Text('Text'),
          ],
          onPressed: (int index) {
            setState(() => selectedList1[index] = !selectedList1[index]);
          },
          isSelected: selectedList1,
        ),
        MainTitleWidget('ToggleButton in custom'),
        ToggleButtons(
          borderColor: Colors.red,
          borderWidth: 2,
          selectedBorderColor: Colors.blue,
          splashColor: Colors.green,
          borderRadius: BorderRadius.circular(8),
          children: [
            Icon(Icons.dashboard),
            Icon(Icons.edit_location),
            Text('Text'),
          ],
          onPressed: (int index) {
            setState(
              () {
                for (int chooseIndex = 0; chooseIndex < selectedList2.length; chooseIndex++) {
                  if (chooseIndex == index) {
                    selectedList2[chooseIndex] = true;
                  } else {
                    selectedList2[chooseIndex] = false;
                  }
                }
              },
            );
          },
          isSelected: selectedList2,
        ),
      ],
    );
  }
}
