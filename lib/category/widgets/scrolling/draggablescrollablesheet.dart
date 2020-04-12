import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class DraggableScrollableSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('基本使用'),
        Expanded(
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
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
                      )
                    ],
                  ),
                ),
              );
            },
            initialChildSize: 0.25,
            maxChildSize: 0.8,
          ),
        ),
      ],
    );
  }
}
