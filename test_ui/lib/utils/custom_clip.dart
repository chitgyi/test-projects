import 'package:flutter/material.dart';

class CustomClip extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }
}
