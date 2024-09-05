import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class CircleProgress extends StatefulWidget {
  const CircleProgress({super.key});

  @override
  State<CircleProgress> createState() => _CircleProgressState();
}

class _CircleProgressState extends State<CircleProgress> {
  late Timer _timer;
  double progress = 0;
  @override
  void initState() {
    super.initState();
    // _timer = Timer.periodic(const Duration(seconds: 1), (t) {
    //   setState(() {
    //     if (progress >= 1) {
    //       _timer.cancel();
    //     }
    //     progress += 0.01;
    //   });
    // });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onPanUpdate: (detail) {
            setState(() {
              progress += detail.delta.dx / 300;
              progress = progress.clamp(0, 1);
            });
          },
          child: CustomPaint(
            painter: CircleProgressPaint(progress),
            size: const Size(400, 500),
          ),
        ),
      ),
    );
  }
}

class CircleProgressPaint extends CustomPainter {
  ///0..1
  double progress = 0;

  CircleProgressPaint(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    var dx = size.width / 2;
    var dy = size.height / 2;
    var radius = min(dx, dy);
    canvas.drawCircle(Offset(dx, dy), radius, paint);

    paint.color = Colors.black;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;
    //绘制线条
    for (int i = 0; i < 60; i++) {
      var linelength = i % 5 == 0 ? 15 : 5;
      var angle = 2 * pi * i / 60;
      Offset start = Offset(dx + radius * cos(angle), dy + radius * sin(angle));
      Offset end = Offset(dx + (radius - linelength) * cos(angle),
          dy + (radius - linelength) * sin(angle));
      canvas.drawLine(start, end, paint);
    }
    var dateTime = DateTime.now();
    double hA = dateTime.hour % 12 * 30 + dateTime.minute * 0.5;

    hA = (hA - 90) * pi / 180;
    Offset starthP = Offset(dx, dy);
    Offset endhP =
        Offset(dx + (radius - 45) * cos(hA), dy + (radius - 45) * sin(hA));

    paint.color = Colors.black;
    canvas.drawLine(starthP, endhP, paint);

    double minA = dateTime.minute * 6 + dateTime.second * 0.1;
    minA = (minA - 90) * pi / 180;
    Offset startmP = Offset(dx, dy);
    Offset endmP =
        Offset(dx + (radius - 35) * cos(minA), dy + (radius - 35) * sin(minA));

    paint.color = Colors.green;
    canvas.drawLine(startmP, endmP, paint);

    double secondsA = dateTime.second * 6;
    secondsA = (secondsA - 90) * pi / 180;
    Offset startP = Offset(dx, dy);
    Offset endP = Offset(
        dx + (radius - 25) * cos(secondsA), dy + (radius - 25) * sin(secondsA));

    paint.color = Colors.blue;
    canvas.drawLine(startP, endP, paint);

    paint.color = Colors.amber;
    canvas.drawCircle(Offset(dx, dy), 5, paint);

    paint.color = Colors.red;
    canvas.drawArc(Rect.fromCircle(center: Offset(dx, dy), radius: radius),
        -2 * pi, 2 * pi * progress, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
