import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class DatePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('DatePicker基本使用'),
        RaisedButton(
          onPressed: () => showMyDatePicker(context),
          child: Text('Open DatePicker'),
        )
      ],
    );
  }

  Future<DateTime> showMyDatePicker(BuildContext context) {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add(
        //未来30天可选
        Duration(days: 30),
      ),
    );
  }
}
