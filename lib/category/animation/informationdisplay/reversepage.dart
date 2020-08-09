import 'package:flutter/material.dart';

class ReversePageWidget extends StatefulWidget {
  @override
  _ReversePageWidgetState createState() => _ReversePageWidgetState();
}

class _ReversePageWidgetState extends State<ReversePageWidget> with TickerProviderStateMixin {
  Animation<Offset> animation;
  Animation<Offset> titleAnimation;
  Animation<Offset> detailAnimation;
  AnimationController backgroundAnimationController;
  AnimationController titleAnimationController;
  AnimationController detailAnimationController;
  CurvedAnimation curvedAnimation;
  Color textColor = Colors.white;

  @override
  void initState() {
    super.initState();
    backgroundAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, -1.0)).animate(backgroundAnimationController);

    titleAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    curvedAnimation = CurvedAnimation(parent: titleAnimationController, curve: Curves.easeOutBack);
    titleAnimation = Tween<Offset>(begin: Offset(0, 0.7), end: Offset(0, 0.0)).animate(curvedAnimation);

    detailAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    curvedAnimation = CurvedAnimation(parent: detailAnimationController, curve: Curves.easeOutBack);
    detailAnimation = Tween<Offset>(begin: Offset(0, 1.0), end: Offset(0, 0.0)).animate(curvedAnimation);

    titleAnimationController.forward().whenComplete(() {
      setState(() => textColor = Colors.black);
      backgroundAnimationController.forward().whenComplete(() {
        detailAnimationController.forward();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _reverseAllAnimationAndPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            SlideTransition(
              position: animation,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                        stops: [0.7, 1.0],
                        colors: [Colors.blueAccent, Colors.white70])),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 34, left: 24, right: 34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/ironman.png',
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 16,
                          ),
                          onPressed: () => _reverseAllAnimationAndPop())
                    ],
                  ),
                  SlideTransition(
                    position: titleAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: Text(
                            'XuYisheng',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SlideTransition(
                      position: detailAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Flutter',
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          Divider(),
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 30,
                              mainAxisSpacing: 10,
                              children: List.generate(2, (index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      image: DecorationImage(image: AssetImage('assets/images/book.jpg'), fit: BoxFit.cover)),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // ignore: missing_return
  Future<bool> _reverseAllAnimationAndPop() {
    detailAnimationController.reverse().whenComplete(() {
      backgroundAnimationController.reverse().whenComplete(() {
        titleAnimationController.reverse().whenComplete(() {
          Navigator.of(context).pop(true);
        });
      });
    });
  }
}
