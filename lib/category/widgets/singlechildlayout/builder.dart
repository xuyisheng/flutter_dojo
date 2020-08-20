import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class BuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MainTitleWidget('在当前上下文创建Context环境'),
          Builder(
            builder: (context) => Center(
              child: RaisedButton(
                onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(content: Text('Context'))),
                child: Text('Set Context'),
              ),
            ),
          ),
          MainTitleWidget('自定义Notification'),
          NotificationListener<MyNotification>(
            onNotification: (MyNotification notification) {
              print('MyNotification：${notification.msg}');
              return false;
            },
            child: Center(
              child: Builder(
                builder: (context) {
                  return RaisedButton(
                    child: Text('Send'),
                    onPressed: () {
                      MyNotification('MyNotification').dispatch(context);
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}
