import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/markdown/widget_markdown_page.dart';
import 'package:flutter_dojo/common/sp_util.dart';
import 'package:share/share.dart';

class BaseWidget extends StatefulWidget {
  final String title;
  final Widget widget;
  final String codePath;

  BaseWidget(this.title, this.codePath, this.widget);

  @override
  _BaseWidgetState createState() {
    return _BaseWidgetState();
  }

}

class _BaseWidgetState extends State<BaseWidget>{

  List<String> collects;
  bool collected = false;

  @override
  Widget build(BuildContext context) {
    collects = List<String>.from(SpUtil.getStringList('collects'));
    collected = collects.indexWhere((element) => element == widget.title) != -1;
    final mediaQuery = MediaQuery.of(context);
    final contentHeight = mediaQuery.size.height - mediaQuery.padding.top - mediaQuery.padding.bottom - kToolbarHeight;
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context, '');
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE6EBEB),
          elevation: 0,
          leading: IconButton(
            icon: const BackButtonIcon(),
            color: Colors.redAccent,
            onPressed: () {
              Navigator.maybePop(context,null);
            },
          ),
          brightness: Brightness.light,
          actions: <Widget>[
            IconButton(
              icon: Icon(collected ? Icons.star : Icons.star_border),
              color: Colors.black54,
              onPressed: (){
                if (mounted){
                  setState(() {
                    if (collected){
                      collects.remove(widget.title);
                    } else {
                      collects.add(widget.title);
                    }
                    SpUtil.putStringList('collects', collects);
                  });
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.code),
              color: Colors.black54,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MarkdownPage(widget.codePath + '.dart'),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.share),
              color: Colors.black54,
              onPressed: () {
                String path = widget.codePath + '.dart';
                getExampleCode(context, path, DefaultAssetBundle.of(context)).then<void>((String code) {
                  var shareText = code ?? 'Example code not found';
                  Share.share(shareText);
                });
              },
            ),
          ],
        ),
        body: Container(
          color: Color(0xFFE6EBEB),
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          height: contentHeight,
          child: Material(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.0),
              bottom: Radius.circular(2.0),
            ),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text(widget.title),
              ),
              body: Container(
                margin: EdgeInsets.all(16),
                child: widget.widget,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
