import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dojo/pages/feed/feed_entity.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FeedDetailPage extends StatefulWidget {
  final Items article;

  const FeedDetailPage({Key key, this.article}) : super(key: key);

  @override
  _FeedDetailPageState createState() => _FeedDetailPageState();
}

class _FeedDetailPageState extends State<FeedDetailPage> {
  WebViewController _webViewController;
  Completer<bool> _finishedCompleter = Completer();

  ValueNotifier canGoBack = ValueNotifier(false);
  ValueNotifier canGoForward = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            FutureBuilder<bool>(
              future: _finishedCompleter.future,
              initialData: false,
              builder: (context, snapshot) => snapshot.data
                  ? SizedBox.shrink()
                  : Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        strokeWidth: 2,
                      ),
                    ),
            ),
            SizedBox(width: 16),
            Expanded(child: Text('Detail')),
          ],
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => Share.share(widget.article.htmlUrl),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: WebView(
          initialUrl: widget.article.htmlUrl,
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            if (!request.url.startsWith('http')) {
              return NavigationDecision.prevent;
            } else {
              return NavigationDecision.navigate;
            }
          },
          onWebViewCreated: (WebViewController controller) => _webViewController = controller,
          onPageFinished: (String value) {
            if (!_finishedCompleter.isCompleted) {
              _finishedCompleter.complete(true);
            }
            refreshNavigator();
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ValueListenableBuilder(
              valueListenable: canGoBack,
              builder: (context, value, child) => IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: !value
                      ? null
                      : () {
                          _webViewController.goBack();
                          refreshNavigator();
                        }),
            ),
            ValueListenableBuilder(
              valueListenable: canGoForward,
              builder: (context, value, child) => IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: !value
                      ? null
                      : () {
                          _webViewController.goForward();
                          refreshNavigator();
                        }),
            ),
            IconButton(
              icon: const Icon(Icons.autorenew),
              onPressed: () => _webViewController.reload(),
            ),
          ],
        ),
      ),
    );
  }

  void refreshNavigator() {
    _webViewController.canGoBack().then((value) => canGoBack.value = value);
    _webViewController.canGoForward().then((value) => canGoForward.value = value);
  }
}
