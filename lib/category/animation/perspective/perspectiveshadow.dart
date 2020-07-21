import 'package:flutter/material.dart';

class PerspectiveShadowWidget extends StatefulWidget {
  @override
  _PerspectiveShadowWidgetState createState() => _PerspectiveShadowWidgetState();
}

class _PerspectiveShadowWidgetState extends State<PerspectiveShadowWidget> {
  double localX = 0;
  double localY = 0;
  bool defaultPosition = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double percentageX = (localX / (size.width - 40)) * 100;
    double percentageY = (localY / 230) * 100;
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(defaultPosition ? 0 : (0.3 * (percentageY / 50) + -0.3))
        ..rotateY(defaultPosition ? 0 : (-0.3 * (percentageX / 50) + 0.3)),
      alignment: FractionalOffset.center,
      child: Container(
        width: double.infinity,
        height: 230,
        decoration: BoxDecoration(
          color: Color(0xFFCCCCCC),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(offset: Offset(0, 60), color: Color.fromARGB(120, 0, 0, 0), blurRadius: 22, spreadRadius: -20),
          ],
        ),
        child: GestureDetector(
          onPanCancel: () => setState(() => defaultPosition = true),
          onPanDown: (_) => setState(() => defaultPosition = false),
          onPanEnd: (_) => setState(() {
            localY = 115;
            localX = (size.width - 40) / 2;
            defaultPosition = true;
          }),
          onPanUpdate: (details) {
            if (mounted) setState(() => defaultPosition = false);
            if (details.localPosition.dx > 0 && details.localPosition.dy < 230) {
              if (details.localPosition.dx < size.width - 40 && details.localPosition.dy > 0) {
                localX = details.localPosition.dx;
                localY = details.localPosition.dy;
              }
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: Colors.black,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(
                        defaultPosition ? 0.0 : (8 * (percentageX / 50) + -8),
                        defaultPosition ? 0.0 : (8 * (percentageY / 50) + -8),
                        0.0,
                      ),
                    alignment: FractionalOffset.center,
                    child: Opacity(
                      opacity: 0.4,
                      child: Image.asset(
                        'images/book.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Transform(
                        transform: Matrix4.translationValues(
                          (size.width - 90) - localX,
                          (230 - 50) - localY,
                          0.0,
                        ),
                        child: AnimatedOpacity(
                          opacity: defaultPosition ? 0 : 0.99,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.decelerate,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.22),
                                blurRadius: 100,
                                spreadRadius: 40,
                              )
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(
                        defaultPosition ? 0.0 : (15 * (percentageX / 50) + -15),
                        defaultPosition ? 0.0 : (15 * (percentageY / 50) + -15),
                        0.0,
                      ),
                    alignment: FractionalOffset.center,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22, top: 15),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: FlutterLogo(size: 90),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
