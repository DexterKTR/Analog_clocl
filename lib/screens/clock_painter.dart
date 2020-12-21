import 'package:flutter/material.dart';
import 'dart:math';

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPainter(this.context, this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.width / 2;
    Offset center = Offset(centerX, centerY);

    // Minute Calculation
    double minX =
        centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);
    double minY =
        centerY + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);

    // Minute line
    canvas.drawLine(
      center,
      Offset(minX, minY),
      Paint()
        ..color = Theme.of(context).accentColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10,
    );

    // Hour Calculation

    double hourX = centerX +
        size.width *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    double hourY = centerY +
        size.width *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    // Hour line
    canvas.drawLine(
        center,
        Offset(hourX, hourY),
        Paint()
          ..color = Theme.of(context).colorScheme.secondary
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10);

    // Second calculaton

    double secondX =
        centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);

    double secondY =
        centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);

    // second Line
    canvas.drawLine(center, Offset(secondX, secondY),
        Paint()..color = Theme.of(context).primaryColor);

    Paint paintDoint = Paint()
      ..color = Theme.of(context).primaryIconTheme.color;
    canvas.drawCircle(center, 24, paintDoint);
    canvas.drawCircle(
        center, 23, Paint()..color = Theme.of(context).backgroundColor);
    canvas.drawCircle(center, 10, paintDoint);
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ClockPainter oldDelegate) => false;
}
