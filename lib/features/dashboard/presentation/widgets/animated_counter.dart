import 'package:fittrack_pro/core/theme/extensions.dart';
import 'package:fittrack_pro/core/util/formatter.dart';
import 'package:flutter/material.dart';

class AnimatedCounter extends StatelessWidget {
  final int count;
  final Duration duration;
  final String? unitText;
  final TextStyle? style;

  const AnimatedCounter({
    super.key,
    required this.count,
    this.duration = const Duration(milliseconds: 1600),
    this.style, this.unitText,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: count),
      duration: duration,
      builder: (context, value, _) => Text(
        "${value.format()}${unitText ?? ""}",
        style: style ?? context.theme.textTheme.headlineMedium
          .withColor(context.theme.colors.lightForeground),
      ),
    );
  }
}
