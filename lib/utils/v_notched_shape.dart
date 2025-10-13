import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VNotchedShape extends NotchedShape {
  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null) return Path()..addRect(host);

    final double barTopY = host.top;
    final double barBottomY = host.bottom;
    final double centerX = host.center.dx;
    final double notchDepth = 45.0.h;
    final double cornerRadius = 20.0.r;

    final double notchRadiusX = 65.r;
    final double notchRadiusY = notchDepth;

    final Path path = Path()
      ..moveTo(host.left + cornerRadius, barTopY)
      ..arcToPoint(
        Offset(host.left, barTopY + cornerRadius),
        radius: Radius.circular(cornerRadius),
        clockwise: false,
      )
      ..lineTo(host.left, barBottomY - cornerRadius)
      ..arcToPoint(
        Offset(host.left + cornerRadius, barBottomY),
        radius: Radius.circular(cornerRadius),
        clockwise: false,
      )
      ..lineTo(host.right - cornerRadius, barBottomY)
      ..arcToPoint(
        Offset(host.right, barBottomY - cornerRadius),
        radius: Radius.circular(cornerRadius),
        clockwise: false,
      )
      ..lineTo(host.right, barTopY + cornerRadius)
      ..arcToPoint(
        Offset(host.right - cornerRadius, barTopY),
        radius: Radius.circular(cornerRadius),
        clockwise: false,
      )
      ..lineTo(centerX + notchRadiusX, barTopY)
      ..cubicTo(
        centerX + notchRadiusX / 2,
        barTopY,
        centerX + notchRadiusX / 3,
        barTopY + notchRadiusY,
        centerX,
        barTopY + notchRadiusY,
      )
      ..cubicTo(
        centerX - notchRadiusX / 3,
        barTopY + notchRadiusY,
        centerX - notchRadiusX / 2,
        barTopY,
        centerX - notchRadiusX,
        barTopY,
      )
      ..close();

    return path;
  }
}
