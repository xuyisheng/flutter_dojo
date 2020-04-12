import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class CupertinoTimerPickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('Picker基本使用'),
        RaisedButton(
          onPressed: () => _showCupertinoPicker(context),
          child: Text('CupertinoPicker'),
        ),
        RaisedButton(
          onPressed: () => _showCupertinoDatePicker(context),
          child: Text('CupertinoDatePicker'),
        ),
        RaisedButton(
          onPressed: () => _showCupertinoTimerPicker(context),
          child: Text('CupertinoTimerPicker'),
        ),
      ],
    );
  }

  void _showCupertinoPicker(BuildContext cxt) {
    final picker = CupertinoPicker(
      itemExtent: 40,
      onSelectedItemChanged: (position) {
        print('The position is $position');
      },
      children: [
        Center(child: Text("0")),
        Center(child: Text("1")),
        Center(child: Text("2")),
        Center(child: Text("3")),
        Center(child: Text("4")),
        Center(child: Text("5")),
        Center(child: Text("6")),
      ],
    );
    showCupertinoModalPopup(
      context: cxt,
      builder: (cxt) {
        return Container(
          height: 200,
          child: picker,
        );
      },
    );
  }

  void _showCupertinoDatePicker(BuildContext cxt) {
    final picker = CupertinoDatePicker(
      onDateTimeChanged: (date) {
        print("the date is ${date.toString()}");
      },
      initialDateTime: DateTime(1995),
    );
    showCupertinoModalPopup(
      context: cxt,
      builder: (cxt) {
        return Container(
          height: 200,
          child: picker,
        );
      },
    );
  }

  void _showCupertinoTimerPicker(BuildContext cxt) {
    showModalBottomSheet(
      context: cxt,
      builder: (BuildContext context) => CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.hms,
        initialTimerDuration: Duration(milliseconds: 200),
        minuteInterval: 1,
        secondInterval: 1,
        onTimerDurationChanged: (value) {},
      ),
    );
  }
}
