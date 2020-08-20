import 'package:flutter/material.dart';

class ItemAnimListWidget extends StatefulWidget {
  @override
  _ItemAnimListWidgetState createState() => _ItemAnimListWidgetState();
}

class _ItemAnimListWidgetState extends State<ItemAnimListWidget> {
  var _scrollController = ScrollController();
  var topScroll = 0.0;
  var percentageY = 1.0;
  var currentIndex = 0;
  var opacity = 1.0;
  static const cardSize = 225;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        currentIndex = _scrollController.offset ~/ cardSize;
        int currentSize = cardSize * currentIndex;
        topScroll = _scrollController.offset - currentSize;
        percentageY = (topScroll / cardSize) * 100;
        var rawOpacity = 1 - (percentageY / 100);
        var offsetOpacity = (percentageY / 100) * 0.25;
        opacity = rawOpacity - offsetOpacity;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey.shade200,
      child: ScrollConfiguration(
        behavior: NoScrollBehavior(),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0015)
                ..rotateX((currentIndex == index) ? (-1.25 * (percentageY / 50)) : index < currentIndex ? 99 : 0),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: SizedBox(
                  height: 200,
                  child: Opacity(
                    opacity: currentIndex == index ? (opacity < 0.0) ? 0 : (opacity > 1.0) ? 1 : opacity : 1,
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                              child: Image.asset('assets/images/book.jpg', fit: BoxFit.fitWidth, width: (size.width - 40) * 0.45),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20, left: (size.width - 40) * 0.45, right: 20),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Android群英传',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10, right: 15),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    'xuyisheng',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: 10,
          controller: _scrollController,
          padding: const EdgeInsets.only(top: 30, bottom: 20),
        ),
      ),
    );
  }
}

class NoScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
