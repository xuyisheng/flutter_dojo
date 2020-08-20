import 'package:flutter/material.dart';

class ModalBarrierWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: ModalBarrier(
          color: Colors.black.withOpacity(.4),
        ),
      ),
    );
  }
}
