import 'package:fittrack_pro/core/theme/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

/// Outlined container for dashboard items with title
class ItemContainer extends StatelessWidget{
  const ItemContainer({super.key, required this.title, required this.subtitle, required this.icon, required this.child});

  final String title;
  final String subtitle;
  final String icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: context.theme.colors.lightSecondary
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                icon, width: 20, height: 20,
                colorFilter: ColorFilter.mode(
                    context.theme.colors.primary,
                    BlendMode.srcIn
                ),
              ),
              const SizedBox(width: 6,),
              Text(
                  title, style: context.theme.textTheme.titleLarge
                    .withColor(context.theme.colors.lightForeground)
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 20),
            child: Text(
                subtitle, style: context.theme.textTheme.bodyMedium
                  .withColor(context.theme.colors.lightMutedForeground)
            ),
          ),
          child
        ],
      ),
    );
  }

}