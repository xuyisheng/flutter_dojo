import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class MarqueeWidget extends StatefulWidget {
  @override
  _MarqueeWidgetState createState() => _MarqueeWidgetState();
}

class _MarqueeWidgetState extends State<MarqueeWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('实现Marquee的两种方式'),
          SubtitleWidget('ListView方式'),
          Container(
            color: Colors.grey.shade200,
            height: 40,
            child: ListMarquee(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text('long long long text.'),
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.grey.shade300,
            child: ListMarquee(
              child: FlutterLogo(size: 80),
            ),
          ),
          Container(
            height: 100,
            color: Colors.grey.shade400,
            child: ListMarquee(
              child: Row(
                children: <Widget>[
                  FlutterLogo(size: 100),
                  Text('text with image'),
                ],
              ),
            ),
          ),
          SubtitleWidget('Clip方式'),
          ClipMarquee(
            child: Text(
              'this is a text.',
              style: TextStyle(fontSize: 40),
            ),
          ),
          ClipMarquee(
            child: Container(
              color: Colors.green,
              child: Text('full screen width text.'),
              width: double.maxFinite,
            ),
          ),
          ClipMarquee(child: FlutterLogo(size: 100)),
          ClipMarquee(
            child: Row(
              children: <Widget>[
                FlutterLogo(size: 100),
                Text('text with image'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClipMarquee extends StatefulWidget {
  final Widget child;

  ClipMarquee({Key key, this.child}) : super(key: key);

  @override
  _ClipMarqueeState createState() => _ClipMarqueeState();
}

class _ClipMarqueeState extends State<ClipMarquee> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 10));
    animation = Tween<Offset>(begin: Offset(1, 0), end: Offset(-1, 0)).animate(controller);
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return ClipRect(
          child: FractionalTranslation(
            translation: animation.value,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: widget.child,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class ListMarquee extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double stepOffset;

  ListMarquee({
    Key key,
    this.child,
    this.duration = const Duration(seconds: 3),
    this.stepOffset = 40,
  }) : super(key: key);

  @override
  _ListMarqueeState createState() => _ListMarqueeState();
}

class _ListMarqueeState extends State<ListMarquee> {
  ScrollController controller;
  Timer timer;
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller = ScrollController(initialScrollOffset: offset);
    timer = Timer.periodic(widget.duration, (timer) {
      double currentOffset = controller.offset + widget.stepOffset;
      if (currentOffset != offset) {
        offset = currentOffset;
        controller.animateTo(offset, duration: widget.duration, curve: Curves.linear);
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      controller: controller,
      itemBuilder: (context, index) {
        return widget.child;
      },
    );
  }
}
