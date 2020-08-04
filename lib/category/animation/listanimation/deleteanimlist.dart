import 'package:flutter/material.dart';

class DeleteAnimListWidget extends StatefulWidget {
  @override
  _DeleteAnimListWidgetState createState() => _DeleteAnimListWidgetState();
}

class _DeleteAnimListWidgetState extends State<DeleteAnimListWidget> with SingleTickerProviderStateMixin {
  List<String> items = List.generate(10, ((i) {
    return 'Item $i';
  }));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      height: MediaQuery.of(context).size.height - 40,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (c, ch) {
          return CartItem();
        },
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> with TickerProviderStateMixin {
  double _size = 180;
  Animation<double> _delayedAnimation;
  Animation<double> _opacityAnimation;
  AnimationController _animationController;
  AnimationController _opacityController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));

    _opacityController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    _opacityAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _opacityController,
        curve: Curves.linear,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.forward();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _delayedAnimation = Tween<double>(begin: 10, end: MediaQuery.of(context).size.width - 32).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _size = 0;
          setState(() {});
        }
      });

    return GestureDetector(
      onTap: () {
        _animationController.forward();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 300,
        height: _size,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            AnimatedBuilder(
              animation: _opacityController,
              builder: (c, ch) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Container(
                    width: double.maxFinite,
                    height: 200,
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12)), boxShadow: [
                      BoxShadow(color: Colors.grey[300], blurRadius: 1),
                    ]),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (c, ch) {
                return Positioned(
                  left: _delayedAnimation.value,
                  child: Icon(
                    Icons.shopping_cart,
                    size: 90,
                    color: Colors.redAccent,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
