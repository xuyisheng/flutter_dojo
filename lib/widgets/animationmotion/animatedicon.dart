import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class AnimatedIconWidget extends StatefulWidget {
  @override
  _AnimatedIconWidgetState createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget> with TickerProviderStateMixin {
  AnimationController controller;
  bool flag = false;
  bool isSlow = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var icons = [
      AnimatedIcons.add_event,
      AnimatedIcons.arrow_menu,
      AnimatedIcons.close_menu,
      AnimatedIcons.ellipsis_search,
      AnimatedIcons.event_add,
      AnimatedIcons.home_menu,
      AnimatedIcons.list_view,
      AnimatedIcons.menu_arrow,
      AnimatedIcons.menu_close,
      AnimatedIcons.menu_home,
      AnimatedIcons.pause_play,
      AnimatedIcons.play_pause,
      AnimatedIcons.search_ellipsis,
      AnimatedIcons.view_list
    ];
    return Column(
      children: <Widget>[
        MainTitleWidget('AnimatedIcon基本使用'),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => Center(
              child: AnimatedIcon(
                icon: icons[index],
                progress: controller,
              ),
            ),
            itemCount: icons.length,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                flag = !flag;
                flag ? controller.forward() : controller.reverse();
              },
              child: Text('Start'),
            ),
            Text('Slow'),
            Switch(
              value: isSlow,
              onChanged: (value) {
                setState(() {
                  isSlow = value;
                  controller.duration = isSlow ? Duration(seconds: 6) : Duration(seconds: 1);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
