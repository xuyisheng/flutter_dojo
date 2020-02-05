import 'package:flutter/material.dart';

class MultiSelectionWidget extends StatefulWidget {
  final List items;
  final List shows;
  final ValueChanged onChange;
  final String title;

  MultiSelectionWidget(this.title, this.items, this.shows, this.onChange);

  @override
  _MultiSelectionWidgetState createState() => _MultiSelectionWidgetState();
}

class _MultiSelectionWidgetState extends State<MultiSelectionWidget> {
  var selectValue;

  @override
  Widget build(BuildContext context) {
    return widget.items.length > 2
        ? ListTile(
            title: Text(widget.title),
            trailing: DropdownButton(
              hint: Text('choose a item'),
              value: selectValue,
              items: widget.items.asMap().keys.map((value) {
                return DropdownMenuItem(
                  value: widget.items[value],
                  child: Text(widget.shows[value].toString()),
                );
              }).toList(),
              onChanged: (value) {
                selectValue = value;
                widget.onChange(value);
              },
            ),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.items.map((value) {
                return Row(
                  children: <Widget>[
                    Radio(
                      value: value,
                      groupValue: selectValue,
                      onChanged: (value) {
                        selectValue = value;
                        widget.onChange(value);
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        selectValue = value;
                        widget.onChange(value);
                      },
                      child: Text('$value'),
                    ),
                  ],
                );
              }).toList(),
            ),
          );
  }
}
