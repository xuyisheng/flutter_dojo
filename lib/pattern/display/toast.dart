import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class ToastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('通过Overlay实现'),
        SubtitleWidget('Overlay可以认为是一个悬浮在UI层之上的蒙版层'),
        SubtitleWidget('Overlay是一个Stack布局，所以可以通过Positioned或者AnimatedPositioned在Overlay中进行定位'),
        RaisedButton(
          onPressed: () {
            Toast.show(context, 'toast in Overlay');
          },
          child: Text('Show Toast'),
        )
      ],
    );
  }
}

class Toast {
  static ToastImp lastOverlayEntry;

  static show(BuildContext context, String message) {
    lastOverlayEntry?.dismiss();
    lastOverlayEntry = null;

    AnimationController animShowController = AnimationController(
      vsync: Overlay.of(context),
      duration: Duration(milliseconds: 300),
    );
    AnimationController animGoneController = AnimationController(
      vsync: Overlay.of(context),
      duration: Duration(milliseconds: 300),
    );
    Animation<double> animShow = Tween(begin: 0.0, end: 1.0).animate(animShowController);
    Animation<double> animGone = Tween(begin: 1.0, end: 0.0).animate(animGoneController);

    // OverlayEntry负责构建布局
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return IgnorePointer(
        // 去掉Overlay的点击拦截
        ignoring: true,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: AnimatedBuilder(
              builder: (BuildContext context, Widget child) {
                return AnimatedBuilder(
                  builder: (BuildContext context, Widget child) {
                    return Center(
                      child: Opacity(
                        child: Opacity(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.yellow.withAlpha(50),
                                border: Border.all(
                                  color: Colors.red,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(message),
                          ),
                          opacity: animGone.value,
                        ),
                        opacity: animShow.value,
                      ),
                    );
                  },
                  animation: animGone,
                );
              },
              animation: animShow,
            ),
          ),
        ),
      );
    });
    ToastImp toastImp = ToastImp(context, overlayEntry, animShowController, animGoneController);
    lastOverlayEntry = toastImp;
    toastImp.showToast();
  }
}

class ToastImp {
  BuildContext context;
  OverlayEntry overlayEntry;
  AnimationController show;
  AnimationController gone;
  bool dismissed = false;

  ToastImp(this.context, this.overlayEntry, this.show, this.gone);

  showToast() async {
    Overlay.of(context).insert(overlayEntry);
    show.forward();
    await Future.delayed(Duration(milliseconds: 3000));
    this.dismiss();
  }

  dismiss() async {
    if (dismissed) {
      return;
    }
    this.dismissed = true;
    gone.forward();
    await Future.delayed(Duration(milliseconds: 300));
    overlayEntry?.remove();
  }
}
