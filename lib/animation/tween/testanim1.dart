import 'package:flutter/material.dart';

class TestAnim1Widget extends StatefulWidget {
  @override
  _TestAnim1WidgetState createState() => _TestAnim1WidgetState();
}

class _TestAnim1WidgetState extends State<TestAnim1Widget> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: CardStack(controller),
          ),
        ),
        FlatButton(
          onPressed: () {
            controller.forward();
          },
          child: Text('Slide'),
        )
      ],
    );
  }
}

class CardStack extends StatefulWidget {
  final AnimationController controller;

  CardStack(this.controller);

  @override
  _CardStackState createState() => _CardStackState();
}

class _CardStackState extends State<CardStack> {
  Animation<Offset> slideAnimation;
  List<SlideCard> cardList;

  @override
  void initState() {
    super.initState();
    cardList = List.generate(5, (index) => SlideCard(index));
    slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1, 0.0),
    ).animate(CurvedAnimation(
      parent: widget.controller,
      curve: Curves.easeInOut,
    ));
    widget.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.controller.reset();
        setState(() => cardList.removeLast());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: cardList.map((item) {
        return Transform.translate(
          offset: Offset(0, -item.index * 5.0),
          child: SlideTransition(
            position: getSlideOffset(item.index),
            child: item,
          ),
        );
      }).toList(),
    );
  }

  getSlideOffset(int cardIndex) {
    if (cardIndex == cardList.length - 1) {
      return slideAnimation;
    } else {
      return AlwaysStoppedAnimation(Offset.zero);
    }
  }
}

class SlideCard extends StatelessWidget {
  final index;

  SlideCard(this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        width: 300,
        height: 400,
        child: Center(
          child: Text(
            '$index',
            style: TextStyle(color: Colors.white, fontSize: 100),
          ),
        ),
      ),
    );
  }
}
