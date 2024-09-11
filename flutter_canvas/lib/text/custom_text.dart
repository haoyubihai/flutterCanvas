import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomText extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..shader = ui.Gradient.linear(Offset.zero,
          Offset(size.width, size.height), [Colors.red, Colors.green]);

    var style = TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        foreground: paint,
        overflow: TextOverflow.ellipsis);
    var text = TextSpan(
        text:
            "Hello flutterHello flutterHello flutterHello flutterHello flutterHello flutter",
        style: style);

    var textpaint = TextPainter(text: text, textDirection: TextDirection.ltr);
    textpaint.layout();

    textpaint.paint(canvas, Offset.zero);

    var strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 1;

    var style2 = TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        foreground: strokePaint,
        overflow: TextOverflow.ellipsis);

    var text2 = TextSpan(
        text:
            "Hello flutterHello flutterHello flutterHello flutterHello flutterHello flutter",
        style: style2);
    var textpaint2 = TextPainter(text: text2, textDirection: TextDirection.ltr);
    textpaint2.layout();

    textpaint2.paint(canvas, Offset.zero);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomTextPage extends StatefulWidget {
  const CustomTextPage({super.key});

  @override
  State<CustomTextPage> createState() => _CustomTextPageState();
}

class _CustomTextPageState extends State<CustomTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomPaint(
            painter: CustomText(),
            size: const Size(300, 300),
          ),
        ),
      ),
    );
  }
}
