import 'package:e_commerce_app/e_commerce_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SignInCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0250000, size.height * 0.0375000);
    path0.quadraticBezierTo(size.width * 0.0292500, size.height * 0.0154250,
        size.width * 0.0750000, size.height * 0.0125000);
    path0.quadraticBezierTo(size.width * 0.7106250, size.height * 0.0143750,
        size.width * 0.9225000, size.height * 0.0150000);
    path0.quadraticBezierTo(size.width * 0.9755250, size.height * 0.0139750,
        size.width * 0.9750000, size.height * 0.0375000);
    path0.lineTo(size.width * 0.9725000, size.height * 0.6060250);
    path0.quadraticBezierTo(size.width * 0.9676250, size.height * 0.6504875,
        size.width * 0.8585000, size.height * 0.6266250);
    path0.cubicTo(
        size.width * 0.6509750,
        size.height * 0.5745375,
        size.width * 0.2800000,
        size.height * 0.4887000,
        size.width * 0.0725000,
        size.height * 0.4320375);
    path0.quadraticBezierTo(size.width * 0.0176250, size.height * 0.4141375,
        size.width * 0.0225000, size.height * 0.3762500);
    path0.quadraticBezierTo(size.width * 0.0231250, size.height * 0.2915625,
        size.width * 0.0250000, size.height * 0.0375000);
    path0.close();

    canvas.drawPath(path0, paint0);

    Paint paint1 = Paint()
      ..color = white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path1 = Path();
    path1.moveTo(size.width * 0.1225000, size.height * 0.4987500);
    path1.quadraticBezierTo(size.width * 0.0118750, size.height * 0.4818750,
        size.width * 0.0250000, size.height * 0.5612500);
    path1.quadraticBezierTo(size.width * 0.0231250, size.height * 0.8443750,
        size.width * 0.0225000, size.height * 0.9387500);
    path1.quadraticBezierTo(size.width * 0.0212500, size.height * 0.9868750,
        size.width * 0.0975000, size.height * 0.9862500);
    path1.lineTo(size.width * 0.8975000, size.height * 0.9887500);
    path1.quadraticBezierTo(size.width * 0.9806250, size.height * 0.9940625,
        size.width * 0.9750000, size.height * 0.9375000);
    path1.quadraticBezierTo(size.width * 0.9750000, size.height * 0.8875000,
        size.width * 0.9750000, size.height * 0.7375000);
    path1.quadraticBezierTo(size.width * 0.9818750, size.height * 0.7050000,
        size.width * 0.8975000, size.height * 0.6875000);
    path1.cubicTo(
        size.width * 0.7037500,
        size.height * 0.6403125,
        size.width * 0.7037500,
        size.height * 0.6403125,
        size.width * 0.1225000,
        size.height * 0.4987500);
    path1.close();

    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
