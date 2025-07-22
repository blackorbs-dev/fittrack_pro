import 'dart:math';
import 'package:flutter/material.dart';

class SpinningArc extends StatefulWidget {
  final double baseRadius;
  final double thickness;
  final double sweepAngle;
  final Color color;
  final Color circleColor;
  final double circleStrokeWidth;
  final Duration duration;

  const SpinningArc({
    super.key,
    this.baseRadius = 32,
    this.thickness = 2.5,
    this.sweepAngle = pi / 1.5,
    this.color = Colors.green,
    this.circleColor = Colors.white24,
    this.circleStrokeWidth = 0.5,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<SpinningArc> createState() => _SpinningArcState();
}

class _SpinningArcState extends State<SpinningArc>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = (widget.baseRadius + widget.thickness + 10) * 2;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return CustomPaint(
          size: Size.square(size),
          painter: BulgedArcPainter(
            baseRadius: widget.baseRadius,
            thickness: widget.thickness,
            startAngle: _controller.value * 2 * pi,
            sweepAngle: widget.sweepAngle,
            arcColor: widget.color,
            circleColor: widget.circleColor,
            circleStrokeWidth: widget.circleStrokeWidth,
          ),
        );
      },
    );
  }
}

class BulgedArcPainter extends CustomPainter {
  final double baseRadius;
  final double thickness;
  final double startAngle;
  final double sweepAngle;
  final Color arcColor;
  final Color circleColor;
  final double circleStrokeWidth;

  BulgedArcPainter({
    required this.baseRadius,
    required this.thickness,
    required this.startAngle,
    required this.sweepAngle,
    required this.arcColor,
    required this.circleColor,
    required this.circleStrokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final path = Path();
    const segments = 60;

    // Draw the base circle
    final baseCirclePaint = Paint()
      ..color = circleColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleStrokeWidth;
    canvas.drawCircle(center, baseRadius, baseCirclePaint);

    //  Create the bulged arc
    for (int i = 0; i <= segments; i++) {
      final t = i / segments;
      final angle = startAngle + sweepAngle * t;

      // Bulge outward based on sine curve
      final bulge = sin(t * pi) * thickness;
      final radius = baseRadius + bulge;

      final dx = center.dx + radius * cos(angle);
      final dy = center.dy + radius * sin(angle);

      if (i == 0) {
        path.moveTo(dx, dy);
      } else {
        path.lineTo(dx, dy);
      }
    }

    // Inner arc: same angle range, constant radius
    for (int i = segments; i >= 0; i--) {
      final t = i / segments;
      final angle = startAngle + sweepAngle * t;

      final dx = center.dx + baseRadius * cos(angle);
      final dy = center.dy + baseRadius * sin(angle);

      path.lineTo(dx, dy);
    }

    path.close();

    //  Paint the arc
    final arcPaint = Paint()
      ..color = arcColor
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, arcPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
