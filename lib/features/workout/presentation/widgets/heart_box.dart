import 'package:fittrack_pro/core/theme/extensions.dart';
import 'package:flutter/material.dart';

import 'pulsing_heart_icon.dart';

class HeartBox extends StatelessWidget{
  const HeartBox({super.key, required this.heartRate});

  final int heartRate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.theme.colors.greenDeep,
      margin: EdgeInsets.only(top: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
            children: [
              Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PulsingHeartIcon(
                      color: context.theme.colors.green,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      children: [
                        Text(
                          '$heartRate',
                          style: context.theme.textTheme.headlineMedium
                            .withColor(context.theme.colors.white),
                        ),
                        Text(
                          'BPM',
                          style: context.theme.textTheme.titleMedium
                            .withColor(context.theme.colors.lightMutedForeground),
                        )
                      ],
                    )
                  ]
              ),
              const SizedBox(height: 10),
              Text(
                'Fat Burn Zone',
                style: context.theme.textTheme.titleSmall?.copyWith(
                    color: context.theme.colors.green
                ),
              )
            ]
        ),
      )
    );
  }

}