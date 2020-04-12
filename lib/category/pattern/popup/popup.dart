import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';

class PopupWidget extends StatefulWidget {
  @override
  _PopupWidgetState createState() => _PopupWidgetState();
}

class _PopupWidgetState extends State<PopupWidget> {
  FocusNode focusNode = FocusNode();
  OverlayEntry textFormOverlayEntry;
  OverlayEntry popupOverlayEntry;
  LayerLink layerLink = LayerLink();
  var locationKey = GlobalKey();

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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                MainTitleWidget('通过Overlay实现Popup'),
                RaisedButton(
                  key: locationKey,
                  onPressed: () => showPopupView(),
                  child: Text('showWeixinButtonView()'),
                ),
                MainTitleWidget('通过Overlay和CompositedTransformTarget实现Popup定位'),
                SubtitleWidget('CompositedTransformTarget还可以自动处理滑动时popup位置的更新'),
                CompositedTransformTarget(
                  link: layerLink,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: '请输入',
                    ),
                    focusNode: focusNode,
                  ),
                ),
                SizedBox(height: 500),
              ],
            ),
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
    RenderBox renderObject = locationKey.currentContext.findRenderObject();
    var size = renderObject.size;
    var offset = renderObject.localToGlobal(Offset.zero);
    popupOverlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: offset.dx,
          top: offset.dy + size.height,
          width: size.width,
          child: Material(
            child: Container(
              height: 100,
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
        );
      },
    );
    Overlay.of(context).insert(popupOverlayEntry);
  }
}
