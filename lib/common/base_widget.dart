import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/markdown/widget_markdown_page.dart';
import 'package:share/share.dart';

class BaseWidget extends StatelessWidget {
  final String title;
  final Widget widget;
  final String codePath;

  BaseWidget(this.title, this.codePath, this.widget);

  @override
  Widget build(BuildContext context) {
    final appbar = buildAppBar(context);
    final mediaQuery = MediaQuery.of(context);
    final contentHeight =
        mediaQuery.size.height - mediaQuery.padding.top - mediaQuery.padding.bottom - appbar.preferredSize.height;

    return Scaffold(
      appBar: appbar,
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
              title: Text(title),
            ),
            body: Container(
              margin: EdgeInsets.all(16),
              child: widget,
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFE6EBEB),
      elevation: 0,
      leading: IconButton(
        icon: const BackButtonIcon(),
        color: Colors.redAccent,
        onPressed: () {
          Navigator.maybePop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.code),
          color: Colors.black54,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MarkdownPage(codePath + '.dart'),
              ),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.share),
          color: Colors.black54,
          onPressed: () {
            String path = codePath + '.dart';
            getExampleCode(context, path, DefaultAssetBundle.of(context)).then<void>((String code) {
              var shareText = code ?? 'Example code not found';
              Share.share(shareText);
            });
          },
        ),
      ],
    );
  }
}
