import 'package:flutter/material.dart';

class MenuSettingWidget extends StatefulWidget {
  @override
  _MenuSettingWidgetState createState() => _MenuSettingWidgetState();
}

class _MenuSettingWidgetState extends State<MenuSettingWidget> with TickerProviderStateMixin {
  static const maxLeftOffset = 100.0;
  var leftOffset = 0.0;

  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 100))
      ..addListener(() {
        setState(() => leftOffset = animation.value);
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Color(0xff191f39),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: <Widget>[
              BackgroundPage(),
              Positioned(
                top: leftOffset / 3,
                left: leftOffset,
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: GestureDetector(
                  onHorizontalDragUpdate: (update) {
                    setState(() {
                      leftOffset += update.delta.dx;
                      leftOffset = leftOffset.clamp(0.0, maxLeftOffset);
                    });
                  },
                  onHorizontalDragEnd: (end) => action(),
                  child: Container(
                    child: FrontPage(action),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  action() {
    animation = Tween(
      begin: leftOffset,
      end: leftOffset == 0 ? maxLeftOffset : 0.0,
    ).animate(controller);
    controller.reset();
    controller.forward();
  }
}

class FrontPage extends StatelessWidget {
  final Function action;

  FrontPage(this.action);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    action();
                  },
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 36,
                  ),
                ),
              ],
            ),
          ),
          Text('FrontPage'),
        ],
      ),
    );
  }
}

class BackgroundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: kToolbarHeight,
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    right: 5,
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
                Text(
                  "Close",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Setting1",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                "Subtitle",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Setting1",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                "Subtitle",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Setting1",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                "Subtitle",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Setting1",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                "Subtitle",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
