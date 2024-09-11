import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CircleRotate extends StatefulWidget {
  const CircleRotate({super.key});

  @override
  State<CircleRotate> createState() => _CircleRotateState();
}

class _CircleRotateState extends State<CircleRotate>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: controller,
          alignment: Alignment.center,
          child: CustomPaint(
            painter: CirclePainter(),
            size: const Size.square(300),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..shader = ui.Gradient.linear(Offset.zero,
          Offset(size.width, size.height), [Colors.red, Colors.green]);
    var radius = min(size.width, size.height)/2;
    canvas.drawCircle(Offset(radius, radius), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
