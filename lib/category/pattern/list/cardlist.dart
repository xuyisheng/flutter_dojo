import 'dart:math';

import 'package:flutter/material.dart';

class CardListWidget extends StatefulWidget {
  @override
  _CardListWidgetState createState() => _CardListWidgetState();
}

class _CardListWidgetState extends State<CardListWidget> {
  @override
  Widget build(BuildContext context) {
    return CardSlider(height: 400);
  }
}

class CardSlider extends StatefulWidget {
  final double height;

  const CardSlider({Key key, this.height}) : super(key: key);

  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  double positionYLine1;
  double positionYLine2;
  List<CardInfo> _cardInfoList;

  double _middleAreaHeight;
  double _outsideCardInterval;
  double scrollOffsetY;

  @override
  void initState() {
    super.initState();
    positionYLine1 = widget.height * 0.1;
    positionYLine2 = positionYLine1 + 200;

    _middleAreaHeight = positionYLine2 - positionYLine1;
    _outsideCardInterval = 30;
    scrollOffsetY = 0;

    _cardInfoList = [
      CardInfo(
        userName: 'ANDREW MITCHELL',
        leftColor: Colors.purpleAccent,
        rightColor: Colors.deepPurple,
      ),
      CardInfo(
        userName: 'ANDREW MITCHELL',
        leftColor: Colors.green,
        rightColor: Colors.teal,
      ),
      CardInfo(
        userName: 'ANDREW MITCHELL',
        leftColor: Colors.grey,
        rightColor: Colors.black,
      ),
      CardInfo(
        userName: 'ANDREW MITCHELL',
        leftColor: Colors.blueAccent,
        rightColor: Colors.blue,
      ),
    ];

    for (var i = 0; i < _cardInfoList.length; i++) {
      CardInfo cardInfo = _cardInfoList[i];
      if (i == 0) {
        cardInfo.positionY = positionYLine1;
        cardInfo.opacity = 1.0;
        cardInfo.scale = 1.0;
        cardInfo.rotate = 1.0;
      } else {
        cardInfo.positionY = positionYLine2 + (i - 1) * 30;
        cardInfo.opacity = 0.7 - (i - 0.5) * 0.1;
        cardInfo.scale = 0.9;
        cardInfo.rotate = -60;
      }
    }
    _cardInfoList = _cardInfoList.reversed.toList();
  }

  _buildCards() {
    List widgetList = [];
    for (CardInfo cardInfo in _cardInfoList) {
      widgetList.add(
        Positioned(
          top: cardInfo.positionY,
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(pi / 180 * cardInfo.rotate)
              ..scale(cardInfo.scale),
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: cardInfo.opacity,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: positionYLine2 - positionYLine1 - 20,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),
                  ],
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      cardInfo.leftColor,
                      cardInfo.rightColor,
                    ],
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: (positionYLine2 - positionYLine1) * 0.5,
                      left: 20,
                      child: Text(
                        '622 828 **** 0278',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // user name
                    Positioned(
                      top: (positionYLine2 - positionYLine1) * 0.6,
                      left: 20,
                      child: Text(
                        cardInfo.userName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // card logo
                    Positioned(
                      bottom: (positionYLine2 - positionYLine1) * 0.02,
                      right: 20,
                      child: Image.asset(
                        'assets/images/book.jpg',
                        height: 100,
                        width: 80,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    return widgetList;
  }

  _updateCardsPosition(double offsetY) {
    void updatePosition(CardInfo cardInfo, double firstCardAreaIdx, int cardIndex) {
      double currentCardAtAtreadIds = firstCardAreaIdx + cardIndex;
      if (currentCardAtAtreadIds < 0) {
        cardInfo.positionY = positionYLine1 + currentCardAtAtreadIds * _outsideCardInterval;

        cardInfo.rotate = -90.0 / _outsideCardInterval * (positionYLine1 - cardInfo.positionY);
        if (cardInfo.rotate > 0.0) cardInfo.rotate = 0.0;
        if (cardInfo.rotate < -90.0) cardInfo.rotate = -90.0;

        cardInfo.scale = 1.0 - 0.2 / _outsideCardInterval * (positionYLine1 - cardInfo.positionY);
        if (cardInfo.scale < 0.8) cardInfo.scale = 0.8;
        if (cardInfo.scale > 1.0) cardInfo.scale = 1.0;

        cardInfo.opacity = 1.0 - 0.73 / _outsideCardInterval * (positionYLine1 - cardInfo.positionY);
        if (cardInfo.opacity < 0.0) cardInfo.opacity = 0.0;
        if (cardInfo.opacity > 1.0) cardInfo.opacity = 1.0;
      } else if (currentCardAtAtreadIds >= 0 && currentCardAtAtreadIds < 1) {
        cardInfo.positionY = positionYLine1 + currentCardAtAtreadIds * _middleAreaHeight;

        cardInfo.rotate = -60.0 / (positionYLine2 - positionYLine1) * (cardInfo.positionY - positionYLine1);
        if (cardInfo.rotate > 0.0) cardInfo.rotate = 0.0;
        if (cardInfo.rotate < -60.0) cardInfo.rotate = -60.0;

        cardInfo.scale = 1.0 - 0.1 / (positionYLine2 - cardInfo.positionY) * (cardInfo.positionY - positionYLine1);
        if (cardInfo.scale < 0.9) cardInfo.scale = 0.9;
        if (cardInfo.scale > 1.0) cardInfo.scale = 1.0;

        cardInfo.opacity = 1.0 - 0.3 / (positionYLine2 - positionYLine1) * (cardInfo.positionY - positionYLine1);
        if (cardInfo.opacity < 0.0) cardInfo.opacity = 0.0;
        if (cardInfo.opacity > 1.0) cardInfo.opacity = 1.0;
      } else if (currentCardAtAtreadIds >= 1) {
        cardInfo.positionY = positionYLine2 + (currentCardAtAtreadIds - 1) * _outsideCardInterval;
        cardInfo.rotate = -60;
        cardInfo.scale = 0.9;
        cardInfo.opacity = 0.7;
      }
      cardInfo.positionY += offsetY;
    }

    scrollOffsetY += offsetY;

    double firstCardAreaIdx = scrollOffsetY / _middleAreaHeight;

    for (var i = 0; i < _cardInfoList.length; i++) {
      CardInfo cardInfo = _cardInfoList[_cardInfoList.length - 1 - i];
      updatePosition(cardInfo, firstCardAreaIdx, i);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails d) {
        _updateCardsPosition(d.delta.dy);
      },
      onVerticalDragEnd: (DragEndDetails d) {
        scrollOffsetY = (scrollOffsetY / _middleAreaHeight).round() * _middleAreaHeight;
        _updateCardsPosition(0);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 230, 228, 232),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ..._buildCards(),
          ],
        ),
      ),
    );
  }
}

class CardInfo {
  String userName;
  String cardCategory;
  double positionY = 0;
  double rotate = 0;
  double scale = 0;
  double opacity = 0;
  Color leftColor;
  Color rightColor;

  CardInfo({
    this.userName,
    this.cardCategory,
    this.positionY,
    this.rotate,
    this.scale,
    this.leftColor,
    this.rightColor,
    this.opacity,
  });
}
