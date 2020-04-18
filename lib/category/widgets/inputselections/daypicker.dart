import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class DayPickerWidget extends StatefulWidget {
  @override
  _DayPickerWidgetState createState() => _DayPickerWidgetState();
}

class _DayPickerWidgetState extends State<DayPickerWidget> {
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  Future<void> chooseDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      selectableDayPredicate: (datetime) {
        if (datetime.day == 10) {
          return false;
        }
        return true;
      },
      initialDatePickerMode: DatePickerMode.day,
      initialDate: _date,
      firstDate: DateTime(2012, 12),
      lastDate: DateTime(2222, 12),
    );
    if (picked != null && picked != _date) setState(() => _date = picked);
    if (picked == null) _date = DateTime.now();
  }

  Future<void> chooseTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    setState(() => _time = picked);
    if (picked == null) _time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('DayPicker基本使用'),
        RaisedButton(
          onPressed: () {
            chooseDate(context);
          },
          child: Text('Choose date'),
        ),
        RaisedButton(
          onPressed: () {
            chooseTime(context);
          },
          child: Text('Choose time'),
        ),
        SubtitleWidget('直接展示 日'),
        Container(
          height: 350,
          child: DayPicker(
              selectedDate: _date,
              currentDate: DateTime.now(),
              onChanged: (date) => setState(() => _date = date),
              firstDate: DateTime(1989),
              lastDate: DateTime(2089),
              displayedMonth: DateTime.now()),
        ),
        SubtitleWidget('直接展示 月'),
        Container(
          height: 350,
          child: MonthPicker(
            selectedDate: _date,
            onChanged: (date) => setState(() => _date = date),
            firstDate: DateTime(1989),
            lastDate: DateTime(2089),
          ),
        ),
        SubtitleWidget('直接展示 年'),
        Container(
          height: 350,
          child: YearPicker(
            selectedDate: _date,
            onChanged: (date) => setState(() => _date = date),
            firstDate: DateTime(1989),
            lastDate: DateTime(2089),
          ),
        )
      ],
    );
  }
}
