import 'package:flutter/material.dart';

class DashLine extends StatefulWidget {
  const DashLine({super.key});

  @override
  State<DashLine> createState() => _DashLineState();
}

class _DashLineState extends State<DashLine> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: DashLinePainter(),
        size: const Size.square(300),
      ),
    );
  }
}

class DashLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    drawPath(canvas, size);
  }

  void drawPath(Canvas canvas, Size size) {
    double dashw = 5.0;
    double space = 2.0;
    double startx = 0;
    var paint = Paint()..color = Colors.black..style=PaintingStyle.stroke..strokeWidth=4;
  
    // canvas.drawPath(path, paint)
    while  (startx <= size.width) {
      canvas.drawLine(Offset(startx, 0), Offset(startx+dashw, 0),paint);
      startx += (dashw + space);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
