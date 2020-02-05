import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class AnimatedModalBarrierWidget extends StatefulWidget {
  @override
  _AnimatedModalBarrierWidgetState createState() {
    return _AnimatedModalBarrierWidgetState();
  }
}

class _AnimatedModalBarrierWidgetState extends State<AnimatedModalBarrierWidget> {
  var _dismissible = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MainTitleWidget('AnimatedModalBarrier基本使用'),
          SubtitleWidget('给模态View添加背景'),
          RaisedButton(
            child: const Text('Open Modal View'),
            onPressed: () {
              Navigator.of(context).push(MyPageRoute(
                page: _ModalPage(),
                dismissible: _dismissible,
              ));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('dismissible'),
              Switch(
                onChanged: (value) {
                  setState(() {
                    _dismissible = value;
                  });
                },
                value: _dismissible,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyPageRoute extends TransitionRoute {
  MyPageRoute({
    @required this.page,
    @required this.dismissible,
  });

  final Widget page;
  final bool dismissible;

  @override
  Iterable<OverlayEntry> createOverlayEntries() {
    return [OverlayEntry(builder: _buildModalBarrier), OverlayEntry(builder: (context) => Center(child: page))];
  }

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  Widget _buildModalBarrier(BuildContext context) {
    return IgnorePointer(
      ignoring: animation.status == AnimationStatus.reverse || animation.status == AnimationStatus.dismissed,
      child: AnimatedModalBarrier(
        color: animation.drive(
          ColorTween(
            begin: Colors.transparent,
            end: Colors.black.withAlpha(80),
          ),
        ),
        dismissible: dismissible,
      ),
    );
  }
}

class _ModalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Modal View'),
            const SizedBox(height: 16),
            RaisedButton(
              child: const Text('Close view'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
