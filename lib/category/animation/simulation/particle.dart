import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';
import 'package:flutter_dojo/common/subtitle_widget.dart';
import 'package:image/image.dart' as image;

class ParticleWidget extends StatefulWidget {
  @override
  _ParticleWidgetState createState() => _ParticleWidgetState();
}

class _ParticleWidgetState extends State<ParticleWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleWidget('粒子效果模拟'),
        SubtitleWidget('基本原理是将图上的每个像素点分散到不同的图层中，再进行动画效果'),
        ParticleContainer(
          duration: Duration(seconds: 2),
          child: Container(
            color: Colors.grey.shade200,
            child: ListTile(
              leading: Icon(
                Icons.star,
                size: 40,
                color: Colors.red,
              ),
              title: Text('Xuyisheng'),
              subtitle: Text('Android群英传'),
              trailing: Icon(
                Icons.favorite,
                size: 40,
                color: Colors.blueAccent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ParticleContainer extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final int numberOfLayers;

  ParticleContainer({
    Key key,
    @required this.child,
    this.duration = const Duration(seconds: 3),
    this.numberOfLayers = 10,
  }) : super(key: key);

  @override
  _ParticleContainerState createState() => _ParticleContainerState();
}

class _ParticleContainerState extends State<ParticleContainer> with SingleTickerProviderStateMixin {
  AnimationController controller;
  GlobalKey globalKey = GlobalKey();
  List<Widget> layers = [];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.duration);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> particle() async {
    image.Image fullImage = await convertWidget2Image();
    int width = fullImage.width;
    int height = fullImage.height;
    List<image.Image> blankLayers = List.generate(widget.numberOfLayers, (i) => image.Image(width, height));
    separatePixels(blankLayers, fullImage, width, height);
    layers = blankLayers.map((layer) => convertImage2Widget(layer)).toList();
    setState(() {});
    controller.forward();
  }

  void separatePixels(List<image.Image> blankLayers, image.Image fullImage, int width, int height) {
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        int pixel = fullImage.getPixel(x, y);
        if (0 == pixel) continue;
        int index = Random().nextInt(widget.numberOfLayers);
        blankLayers[index].setPixel(x, y, pixel);
      }
    }
  }

  Future<image.Image> convertWidget2Image() async {
    RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
    var img = await boundary.toImage();
    var byteData = await img.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData.buffer.asUint8List();
    return image.decodeImage(pngBytes);
  }

  Widget convertImage2Widget(image.Image png) {
    Uint8List data = Uint8List.fromList(image.encodePng(png));
    CurvedAnimation animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    Animation<Offset> offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(-20, -20) + Offset(50, 50).scale(Random().nextDouble(), Random().nextDouble()),
    ).animate(animation);

    return AnimatedBuilder(
      animation: controller,
      child: Image.memory(data),
      builder: (context, child) {
        return Transform.translate(
          offset: offsetAnimation.value,
          child: Opacity(
            opacity: cos(animation.value * pi / 2),
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            ...layers,
            GestureDetector(
              onTap: () => particle(),
              child: controller.isAnimating
                  ? Container()
                  : RepaintBoundary(
                      key: globalKey,
                      child: widget.child,
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
