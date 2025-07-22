import 'package:fittrack_pro/core/theme/extensions.dart';
import 'package:fittrack_pro/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MorphingFab extends StatefulWidget {
  const MorphingFab({super.key});

  @override
  State<MorphingFab> createState() => _MorphingFabState();
}

class _MorphingFabState extends State<MorphingFab>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  void _toggleExpanded() {
    if (_isExpanded) {
      context.read<DashboardCubit>().startWorkout();
    }
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return GestureDetector(
      onTap: _toggleExpanded,
      child: AnimatedRotation(
        duration: const Duration(milliseconds: 400),
        turns: _isExpanded ? 0 : 0.125, // 0.125 turn = 45 degrees
        child: AnimatedSize(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            constraints: const BoxConstraints(minHeight: 56, minWidth: 56),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.colors.primary, theme.colors.secondary,],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius:
              BorderRadius.circular(_isExpanded ? 16 : 8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _isExpanded ? Icons.play_arrow : Icons.close_rounded,
                  color: theme.colors.lightForeground,
                  size: 22,
                ),
                  _isExpanded ? Padding(
                    key: const ValueKey("text"),
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Start", style: theme.textTheme.titleMedium
                          .withColor(theme.colors.lightForeground),
                    ),
                  ) : const SizedBox.shrink(key: ValueKey("empty"),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
