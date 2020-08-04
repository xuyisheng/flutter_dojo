import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class DatePickerWidget extends StatefulWidget {
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  var entryMode = DatePickerEntryMode.calendar;
  var pickMode = DatePickerMode.year;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('DatePicker基本使用'),
        MultiSelectionWidget(
          'EntryMode',
          DatePickerEntryMode.values,
          DatePickerEntryMode.values,
          (value) => setState(() => entryMode = value),
        ),
        MultiSelectionWidget(
          'PickMode',
          DatePickerMode.values,
          DatePickerMode.values,
          (value) => setState(() => pickMode = value),
        ),
        RaisedButton(
          onPressed: () => showMyDatePicker(context),
          child: Text('Open DatePicker'),
        ),
      ],
    );
  }

  Future<DateTime> showMyDatePicker(BuildContext context) {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      confirmText: 'Confirm',
      cancelText: 'Cancel',
      initialDate: date,
      firstDate: date,
      lastDate: date.add(
        //未来30天可选
        Duration(days: 30),
      ),
      initialEntryMode: entryMode,
      initialDatePickerMode: pickMode,
    );
  }
}
