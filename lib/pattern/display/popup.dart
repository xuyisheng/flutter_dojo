import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class PopupWidget extends StatefulWidget {
  @override
  _PopupWidgetState createState() => _PopupWidgetState();
}

class _PopupWidgetState extends State<PopupWidget> {
  FocusNode focusNode = FocusNode();
  OverlayEntry textFormOverlayEntry;
  OverlayEntry popupOverlayEntry;
  LayerLink layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        textFormOverlayEntry = createSelectPopup();
        Overlay.of(context).insert(textFormOverlayEntry);
      } else {
        textFormOverlayEntry.remove();
        textFormOverlayEntry = null;
      }
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (popupOverlayEntry != null) {
          popupOverlayEntry.remove();
          popupOverlayEntry = null;
          return Future.value(false);
        }
        if (textFormOverlayEntry != null) {
          textFormOverlayEntry.remove();
          textFormOverlayEntry = null;
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: GestureDetector(
        onTap: () => clear(),
        child: Container(
          color: Colors.white, // 必须要有颜色才能响应点击
          child: Column(
            children: <Widget>[
              MainTitleWidget('通过Overlay实现Popup'),
              RaisedButton(
                onPressed: () => showPopupView(),
                child: Text('showWeixinButtonView()'),
              ),
              MainTitleWidget('通过Overlay和CompositedTransformTarget实现Popup定位'),
              CompositedTransformTarget(
                link: layerLink,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '请输入',
                  ),
                  focusNode: focusNode,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clear() {
    if (popupOverlayEntry != null) {
      popupOverlayEntry.remove();
      popupOverlayEntry = null;
    }
    if (textFormOverlayEntry != null) {
      textFormOverlayEntry.remove();
      textFormOverlayEntry = null;
    }
  }

  OverlayEntry createSelectPopup() {
    clear();
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: 200,
          child: CompositedTransformFollower(
            offset: Offset(0.0, 50),
            link: layerLink,
            child: Material(
              child: Container(
                color: Colors.grey.shade200,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Item1'),
                      onTap: () {
                        focusNode.unfocus();
                      },
                    ),
                    ListTile(
                      title: Text('Item2'),
                      onTap: () {
                        focusNode.unfocus();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    return overlayEntry;
  }

  showPopupView() {
    clear();
    popupOverlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: 250,
          right: 24,
          width: 200,
          height: 200,
          child: SafeArea(
            child: Material(
              child: Container(
                color: Colors.grey.shade200,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        leading: Icon(Icons.add),
                        title: Text('发起群聊'),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Icon(Icons.add),
                        title: Text('添加朋友'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(popupOverlayEntry);
  }
}
