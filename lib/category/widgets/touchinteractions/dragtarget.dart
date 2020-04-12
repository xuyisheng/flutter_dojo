import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class DragTargetWidget extends StatefulWidget {
  @override
  _DragTargetWidgetState createState() => _DragTargetWidgetState();
}

class _DragTargetWidgetState extends State<DragTargetWidget> {
  String status = '';
  bool isAccept = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('DragTarget基本使用'),
        Container(
          margin: EdgeInsets.only(top: 20),
          width: 300,
          height: 200,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Draggable(
                  onDraggableCanceled: (v, f) {
                    setState(() => status = 'onDraggableCanceled');
                  },
                  onDragStarted: () {
                    setState(() => isAccept = false);
                  },
                  data: 1.0,
                  child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    color: Colors.blue,
                    child: Text('Drag'),
                  ),
                  feedback: Opacity(
                    opacity: 0.5,
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: Text(
                        'Drag',
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: DragTarget(
                  builder: (BuildContext context, List<dynamic> candidateData, List<dynamic> rejectedData) {
                    return Container(
                      width: 80,
                      height: 80,
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: isAccept
                          ? Container(
                              width: 30,
                              height: 30,
                              color: Colors.green,
                            )
                          : Text('Target'),
                    );
                  },
                  onWillAccept: (double value) {
                    setState(() => status = 'onWillAccept: $value');
                    return true;
                  },
                  onAccept: (double value) {
                    setState(() {
                      isAccept = true;
                      return status = 'onAccept: $value';
                    });
                  },
                  onLeave: (double value) {
                    setState(() => status = 'onLeave: $value');
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Text(status),
              )
            ],
          ),
        ),
      ],
    );
  }
}
