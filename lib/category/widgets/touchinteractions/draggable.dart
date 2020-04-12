import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/multi_selection_widget.dart';

class DraggableWidget extends StatefulWidget {
  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  var axis = Axis.horizontal;
  var show = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('Draggable基本使用'),
        Text(show),
        Container(
          child: Draggable<Color>(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: Center(
                child: Text('Child'),
              ),
            ),
            feedback: Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
              child: Center(
                child: Text(
                  'feedback',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            childWhenDragging: Container(
              color: Colors.cyan,
              width: 150,
              height: 150,
              child: Center(
                child: Text('childWhenDragging'),
              ),
            ),
            data: Colors.green,
            onDragStarted: () {
              setState(() => show = 'Drag start');
            },
            onDragEnd: (details) {
              setState(() => show = 'Drag end');
            },
          ),
        ),
        MainTitleWidget('Draggable限制Axis'),
        MultiSelectionWidget(
          'Axis',
          Axis.values,
          Axis.values,
          (value) {
            setState(() => axis = value);
          },
        ),
        Container(
          child: Draggable<Color>(
            axis: axis,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: Center(
                child: Text('Child'),
              ),
            ),
            feedback: Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
              child: Center(
                child: Text(
                  'feedback',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            data: Colors.green,
          ),
        ),
      ],
    );
  }
}
