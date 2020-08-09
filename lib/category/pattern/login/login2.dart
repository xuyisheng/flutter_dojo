import 'dart:math';

import 'package:flutter/material.dart';

class Login2 extends StatefulWidget {
  Login2({Key key}) : super(key: key);

  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> with TickerProviderStateMixin {
  PageController pageController;
  PageView pageView;
  int currentPage = 0;
  Color left = Colors.black;
  Color right = Colors.white;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageView = PageView(
      controller: pageController,
      children: <Widget>[
        SignInPage(),
        SignUpPage(),
      ],
      onPageChanged: (index) {
        setState(() {
          if (index == 0) {
            right = Colors.white;
            left = Colors.black;
          } else if (index == 1) {
            right = Colors.black;
            left = Colors.white;
          }
          currentPage = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [Colors.blueAccent, Colors.deepOrangeAccent],
            stops: const [0.0, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(height: 75),
            Image(width: 250, height: 191, image: AssetImage('assets/images/book.jpg')),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Container(
                width: 300.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0x552B2B2B),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                child: CustomPaint(
                  painter: TabIndicationPainter(pageController: pageController),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: null,
                          child: Text(
                            'Existing',
                            style: TextStyle(color: left, fontSize: 16.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: null,
                          child: Text(
                            'New',
                            style: TextStyle(color: right, fontSize: 16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: pageView),
          ],
        ),
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              buildSignInTextForm(),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(fontSize: 16, color: Colors.white, decoration: TextDecoration.underline),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 1,
                      width: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white10, Colors.white],
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.white, Colors.white10]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            child: buildSignInButton(),
            top: 170,
          )
        ],
      ),
    );
  }

  Widget buildSignInTextForm() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      width: 300,
      height: 190,
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      hintText: 'Email Address',
                      border: InputBorder.none),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  onSaved: (value) {},
                ),
              ),
            ),
            Container(
              height: 1,
              width: 250,
              color: Colors.grey[400],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    hintText: 'Password',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  onSaved: (value) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSignInButton() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: 42, right: 42, top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
            colors: const [Color(0xFFfbab66), Color(0xFFf7418c)],
            stops: const [0.0, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Text(
          'LOGIN',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23),
      child: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white,
              ),
              width: 300,
              height: 360,
              child: buildSignUpTextForm()),
          Positioned(
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 42, right: 42),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: const [Color(0xFFfbab66), Color(0xFFf7418c)],
                    stops: const [0.0, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Text(
                  'SignUp',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            top: 340,
          )
        ],
      ),
    );
  }

  Widget buildSignUpTextForm() {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          //用户名字
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.supervised_user_circle,
                      color: Colors.black,
                    ),
                    hintText: 'Name',
                    border: InputBorder.none),
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          Container(
            height: 1,
            width: 250,
            color: Colors.grey[400],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    hintText: 'Email Address',
                    border: InputBorder.none),
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          Container(
            height: 1,
            width: 250,
            color: Colors.grey[400],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  hintText: 'Password',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
                obscureText: true,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          Container(
            height: 1,
            width: 250,
            color: Colors.grey[400],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  hintText: 'Confirm Passowrd',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
                obscureText: true,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabIndicationPainter extends CustomPainter {
  Paint painter;
  final double dxTarget;
  final double dxEntry;
  final double radius;
  final double dy;

  final PageController pageController;

  TabIndicationPainter(
      {this.dxTarget = 125.0, this.dxEntry = 25.0, this.radius = 21.0, this.dy = 25.0, this.pageController})
      : super(repaint: pageController) {
    painter = Paint()
      ..color = Color(0xFFFFFFFF)
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final pos = pageController.position;
    double fullExtent = (pos.maxScrollExtent - pos.minScrollExtent + pos.viewportDimension);

    double pageOffset = pos.extentBefore / fullExtent;

    bool left2right = dxEntry < dxTarget;
    Offset entry = Offset(left2right ? dxEntry : dxTarget, dy);
    Offset target = Offset(left2right ? dxTarget : dxEntry, dy);

    Path path = Path();
    path.addArc(Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, 1 * pi);
    path.addRect(Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));
    path.addArc(Rect.fromCircle(center: target, radius: radius), 1.5 * pi, 1 * pi);

    canvas.translate(size.width * pageOffset, 0.0);
    canvas.drawShadow(path, Color(0xFFfbab66), 3.0, true);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(TabIndicationPainter oldDelegate) => true;
}
