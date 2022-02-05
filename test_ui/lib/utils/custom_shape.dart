import 'package:flutter/material.dart';
import 'package:test_ui/utils/constants/custom_colors.dart';

class CustomShape extends CustomPainter {
  final Color? fillColor;
  final bool bothSide;
  CustomShape({this.fillColor, this.bothSide = false});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    if (bothSide) {
      path.moveTo(size.width - (size.width * 0.09), size.height);
    } else {
      path.moveTo(size.width, size.height);
    }
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.09, 0);
    path.lineTo(0, size.height);
    if (bothSide) {
      path.lineTo(size.width - (size.width * 0.09), size.height);
    } else {
      path.lineTo(size.width, size.height);
    }
    path.close();

    Paint pint = Paint();
    if (fillColor == null) {
      pint.style = PaintingStyle.stroke;
      pint.color = CustomColors.secondary;
    } else {
      pint.style = PaintingStyle.fill;
      pint.color = fillColor!;
    }
    canvas.drawPath(path, pint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
