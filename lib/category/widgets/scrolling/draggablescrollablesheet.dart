import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class DraggableScrollableSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('基本使用'),
        SubtitleWidget('A widget that can notify a descendent [DraggableScrollableSheet] that it should reset its position to the initial state.'),
        Expanded(
          child: DraggableScrollableActuator(
            child: DraggableScrollableSheet(
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    child: Column(
                      children: <Widget>[
                        FlutterLogo(
                          size: 100,
                        ),
                        FlutterLogo(
                          size: 100,
                        ),
                        FlutterLogo(
                          size: 100,
                        ),
                        FlutterLogo(
                          size: 100,
                        ),
                        RaisedButton(
                          onPressed: () => DraggableScrollableActuator.reset(context),
                          child: Text('close'),
                        ),
                      ],
                    ),
                  ),
                );
              },
              initialChildSize: 0.25,
              maxChildSize: 0.8,
            ),
          ),
        ),
      ],
    );
  }
}
