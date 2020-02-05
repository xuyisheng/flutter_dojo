import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class LongPressDraggableWidget extends StatefulWidget {
  final List _list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].toList();

  @override
  State<StatefulWidget> createState() => _LongPressDraggableWidgetState();
}

class _LongPressDraggableWidgetState extends State<LongPressDraggableWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('LongPressDraggable基本使用'),
        Expanded(
          child: GridView.count(
            childAspectRatio: 1.5,
            crossAxisCount: 3,
            children: _renderWidget(),
            padding: EdgeInsets.only(top: 10),
          ),
        ),
      ],
    );
  }

  List<Widget> _renderWidget() {
    final List list = List<Widget>();
    for (int i = 0; i < widget._list.length; i++) {
      list.add(_buildDragWidget(i));
    }
    return list;
  }

  Widget _buildDragWidget(int index) {
    return LongPressDraggable(
      data: index,
      feedbackOffset: Offset(0, 0),
      // axis: Axis.vertical,
      child: DragTarget<int>(
        onAccept: (data) {
          print('accept index $data');
          setState(() {
            final temp = widget._list[data];
            widget._list.remove(temp);
            widget._list.insert(index, temp);
          });
        },
        onWillAccept: (data) {
          print("current index: $index, on will accept $data");
          return true;
        },
        onLeave: (data) {
          print('index $index , leave $data');
        },
        builder: (context, data, rejects) {
          print('builder = $data,  rejects= $rejects');
          return Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Text('index = ${widget._list[index]}'),
          );
        },
      ),
      feedback: SizedBox(
        width: 80,
        height: 40,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Text(
            'index=${widget._list[index]}',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ),
      onDragCompleted: () {
        print('onDragCompleted');
      },
      onDragEnd: (details) {
        print('onDragEnd ${details.wasAccepted} ${details.velocity} ${details.offset}');
      },
      onDragStarted: () {
        print('onDragStarted');
      },
      // 拖动时替换原来位置的widget
      // childWhenDragging: Center(
      //   child: Icon(
      //     Icons.ac_unit,
      //     color: Colors.redAccent,
      //   ),
      // ),
    );
  }
}
