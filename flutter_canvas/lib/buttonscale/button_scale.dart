import 'package:flutter/material.dart';

class ButtonScale extends StatefulWidget {
  const ButtonScale({super.key});

  @override
  State<ButtonScale> createState() => _ButtonScaleState();
}

class _ButtonScaleState extends State<ButtonScale> {
  var isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isPressed ? 200 : 260,
          height: isPressed ? 200 : 260,
          color: Colors.amberAccent,
        ),
        onPanDown: (e) {
          setState(() {
            isPressed = true;
          });
        },
        onPanCancel: () {
          setState(() {
            isPressed = false;
          });
        },
        onPanEnd: (e) {
          setState(() {
            isPressed = false;
          });
        },
      ),
    );
  }
}
