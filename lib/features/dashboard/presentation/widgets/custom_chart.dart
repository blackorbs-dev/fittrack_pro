import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../domain/models/data_point.dart';

class LineChart extends StatelessWidget {
  final List<DataPoint> data;

  const LineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) =>
      CustomPaint(
        painter: LineChartPainter(data),
        size: const Size(double.infinity, 200),
      );
}

class LineChartPainter extends CustomPainter {
  final List<DataPoint> data;
  final double labelWidth = 30;

  LineChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final chartWidth = size.width - labelWidth;
    final chartHeight = size.height;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.redAccent;

    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        colors: [Colors.redAccent.withValues(alpha: 0.3), Colors.transparent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(labelWidth, 0, chartWidth, chartHeight));

    final minValue = data.map((e) => e.value).reduce(min);
    final maxValue = data.map((e) => e.value).reduce(max);
    final valueRange = max(1, (maxValue - minValue).toDouble());

    final startTime = data.first.time.millisecondsSinceEpoch.toDouble();
    final endTime = data.last.time.millisecondsSinceEpoch.toDouble();
    final timeRange = endTime - startTime;

    // Build points
    final points = data.map((point) {
      final x = ((point.time.millisecondsSinceEpoch - startTime) / timeRange) * chartWidth + labelWidth;
      final y = chartHeight - ((point.value - minValue) / valueRange) * chartHeight;
      return Offset(x, y);
    }).toList();

    // Create smooth path
    final path = _createSmoothPath(points);

    // Fill under curve
    final fillPath = Path.from(path)
      ..lineTo(points.last.dx, chartHeight)
      ..lineTo(points.first.dx, chartHeight)
      ..close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);

    _drawGridLines(canvas, chartWidth, chartHeight, minValue, maxValue);
  }

  Path _createSmoothPath(List<Offset> points) {
    final path = Path();
    if (points.length < 2) return path;

    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length - 1; i++) {
      final current = points[i];
      final next = points[i + 1];
      final controlPoint = Offset(
        (current.dx + next.dx) / 2,
        (current.dy + next.dy) / 2,
      );
      path.quadraticBezierTo(current.dx, current.dy, controlPoint.dx, controlPoint.dy);
    }

    // Draw the last segment
    path.lineTo(points.last.dx, points.last.dy);
    return path;
  }


  void _drawGridLines(Canvas canvas, double chartWidth, double chartHeight, int minHR, int maxHR) {
    const gridLines = 4;
    final step = (maxHR - minHR) / gridLines;

    final gridPaint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.2)
      ..strokeWidth = 1;

    final textStyle = TextStyle(color: Colors.grey[700], fontSize: 12);

    for (int i = 0; i <= gridLines; i++) {
      final y = chartHeight * (i / gridLines);
      final hrValue = (maxHR - step * i).round();

      canvas.drawLine(Offset(labelWidth, y), Offset(chartWidth + labelWidth, y), gridPaint);

      final textSpan = TextSpan(text: '$hrValue', style: textStyle);
      final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr)..layout();
      tp.paint(canvas, Offset(labelWidth - tp.width - 4, y - tp.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant LineChartPainter oldDelegate) {
    return !listEquals(oldDelegate.data, data);
  }
}

