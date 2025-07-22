import 'package:fittrack_pro/core/theme/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'animated_counter.dart';

class StatCard extends StatelessWidget {
  final String title;
  final int count;
  final String? unitText;
  final String smallText;
  final String icon;
  final List<Color> gradientColors;
  final Animation<double> bounceAnimation;

  const StatCard({
    required this.title,
    required this.count,
    required this.smallText,
    required this.icon,
    this.gradientColors = const [Color(0xFF6D8EFF), Color(0xFF8EC5FC)],
    required this.bounceAnimation,
    super.key, this.unitText,
  });

//   @override
//   State<StatCard> createState() => _StatCardState();
// }
//
// class _StatCardState extends State<StatCard> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _offsetY;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );//..repeat(reverse: true);
//
//     _offsetY = Tween<double>(begin: -4, end: 4).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//
//     if (widget.delay == Duration.zero) {
//       _controller.repeat(reverse: true);
//     } else {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         Future.delayed(widget.delay, () {
//           if (mounted) {
//             _controller.repeat(reverse: true);
//           }
//         });
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Animated icon in top right
          Positioned(
            top: 18,
            right: 12,
            child: AnimatedBuilder(
              animation: bounceAnimation,
              builder: (_, child) {
                return Transform.translate(
                  offset: Offset(0, bounceAnimation.value),
                  child: child,
                );
              },
              child: SvgPicture.asset(
                  icon, width: 32, height: 32,
                  colorFilter: ColorFilter.mode(context.theme.colors.lightForeground, BlendMode.srcIn),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    title,
                    style: context.theme.textTheme.titleMedium
                      .withColor(context.theme.colors.lightForeground)
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 4),
                  child: AnimatedCounter(count: count, unitText: unitText,),
                ),
                Text(
                    smallText,
                    style: context.theme.textTheme.bodySmall
                      .withColor(context.theme.colors.lightForeground)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
