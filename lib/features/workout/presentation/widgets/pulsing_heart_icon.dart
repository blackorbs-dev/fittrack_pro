import 'package:flutter/material.dart';

class PulsingHeartIcon extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;

  const PulsingHeartIcon({
    super.key,
    this.color = Colors.green,
    this.size = 68.0,
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  State<PulsingHeartIcon> createState() => _PulsingHeartIconState();
}

class _PulsingHeartIconState extends State<PulsingHeartIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true); // pulse back and forth

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.25).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Icon(
        Icons.favorite,
        color: widget.color,
        size: widget.size,
      ),
    );
  }
}
