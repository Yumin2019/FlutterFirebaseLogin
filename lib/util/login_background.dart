
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
    canvas.drawCircle(Offset(size.width * 0.5, 0), size.height * 0.5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}