import 'dart:async';

import 'package:flutter/material.dart';

class AnimListWidget extends StatefulWidget {
  @override
  _AnimListWidgetState createState() => _AnimListWidgetState();
}

class _AnimListWidgetState extends State<AnimListWidget> {
  List<String> _list = ['Xu', 'Yi', 'Sheng', 'Zhu', 'Jia'].toList();
  StreamController<int> _streamController = StreamController.broadcast();

  @override
  void initState() {
    startAnimation(_list.length, Duration(milliseconds: 300));
    super.initState();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemLayout(
          child: _buildWidgetExample(_list[index]),
          duration: Duration(milliseconds: 300),
          position: index,
          stream: _streamController.stream,
        );
      },
    );
  }

  startAnimation(int limit, Duration duration) async {
    for (var i = -1; i < limit; i++) {
      await Future.delayed(duration, () {
        _streamController.add(i);
      });
    }
  }
}

class ItemLayout extends StatefulWidget {
  final int position;
  final Widget child;
  final Duration duration;
  final Stream<int> stream;

  ItemLayout({this.position, this.child, this.duration, this.stream});

  _ItemLayout createState() => _ItemLayout();
}

class _ItemLayout extends State<ItemLayout> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _offset = Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.stream,
        initialData: -1,
        builder: (context, AsyncSnapshot<int> snapshot) {
          if (snapshot.data >= widget.position && snapshot.data > -1) _controller.forward();
          return SlideTransition(position: _offset, child: widget.child);
        });
  }
}

Widget _buildWidgetExample(String text) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    height: 80,
    width: double.infinity,
    margin: EdgeInsets.all(8),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ),
  );
}
