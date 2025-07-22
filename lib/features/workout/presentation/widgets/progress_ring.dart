import 'dart:math';
import 'package:flutter/material.dart';

class ProgressRing extends StatefulWidget {
  final double progress; // 0.0 - 1.0
  final List<Color> segments;
  final Color backgroundColor;
  final double strokeWidth;

  const ProgressRing({
    required this.progress,
    this.segments = const [Colors.purple, Colors.green, Colors.orange, Colors.green],
    this.strokeWidth = 12.0,
    this.backgroundColor = Colors.white10,
    super.key,
  });

  @override
  State<ProgressRing> createState() => _ProgressRingState();
}

class _ProgressRingState extends State<ProgressRing>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animatedProgress;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _animatedProgress = Tween<double>(begin: 0, end: widget.progress).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant ProgressRing oldWidget) {
    if (oldWidget.progress != widget.progress) {
      _animatedProgress = Tween<double>(
        begin: oldWidget.progress,
        end: widget.progress,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ));
      _controller.forward(from: 0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animatedProgress,
      builder: (context, child) {
        return CustomPaint(
          size: const Size.square(232),
          painter: _RingPainter(
            progress: _animatedProgress.value,
            segments: widget.segments,
            strokeWidth: widget.strokeWidth,
            backgroundColor: widget.backgroundColor
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _RingPainter extends CustomPainter {
  final double progress;
  final List<Color> segments;
  final Color backgroundColor;
  final double strokeWidth;

  _RingPainter({
    required this.progress,
    required this.segments,
    required this.strokeWidth,
    required this.backgroundColor
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2;

    final rect = Rect.fromCircle(center: center, radius: radius);
    final totalSweep = 2 * pi * progress;

    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // draw background ring
    canvas.drawArc(rect, 0, 2 * pi, false, bgPaint);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..shader = SweepGradient(
        startAngle: -pi*1.5,
        endAngle: pi * 2,
        colors: segments,
      ).createShader(rect);

    // Draw main circle only the portion up to `progress`
    canvas.drawArc(
      rect,
      pi*1.5,
      totalSweep,
      false,
      paint,
    );
  }


  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.segments != segments;
}
