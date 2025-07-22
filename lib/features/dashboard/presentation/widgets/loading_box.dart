import 'package:fittrack_pro/core/theme/extensions.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/spinning_arc.dart';
import 'package:flutter/cupertino.dart';

class LoadingBox extends StatelessWidget{
  const LoadingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SpinningArc(),
          const SizedBox(height: 8,),
          Text(
              'Listening for active workout session...', style: context.theme.textTheme.bodyMedium
                .withColor(context.theme.colors.lightMutedForeground)
          )
        ],
      ));
  }

}