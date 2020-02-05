import 'package:flutter/material.dart';

class ListTopBottomWidget extends StatefulWidget {
  @override
  _ListTopBottomWidgetState createState() => _ListTopBottomWidgetState();
}

class _ListTopBottomWidgetState extends State<ListTopBottomWidget> {
  final initList = List<String>.generate(100, (i) => "Item $i");
  ScrollController scrollController;
  bool showFAB = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(onScroll);
  }

  onScroll() {
    if (scrollController.offset < 500 && showFAB) {
      setState(() => showFAB = false);
    } else if (scrollController.offset >= 500 && showFAB == false) {
      setState(() => showFAB = true);
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(onScroll);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                shrinkWrap: true,
                itemCount: initList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${initList[index]}'),
                  );
                },
              ),
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  onPressed: () => scrollToTop(),
                  child: Text('Top'),
                ),
                RaisedButton(
                  onPressed: () => scrollToBottom(),
                  child: Text('Bottom'),
                ),
              ],
            )
          ],
        ),
        Positioned(
          right: 20,
          bottom: 100,
          child: showFAB
              ? FloatingActionButton(
                  onPressed: () {},
                  child: Text('F'),
                )
              : Container(),
        ),
      ],
    );
  }

  scrollToTop() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeIn,
    );
    setState(() {});
  }

  scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeOut,
    );
    setState(() {});
  }
}
