import 'package:fittrack_pro/core/theme/extensions.dart';
import 'package:flutter/cupertino.dart';

class LabelText extends StatelessWidget{
  const LabelText(this.text, {super.key, this.margin = const EdgeInsets.only(top: 18)});
  
  final String text;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: context.theme.colors.greenDeep,
            border: Border.all(color: context.theme.colors.green),
            borderRadius: BorderRadius.circular(18)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        margin: margin,
        child: Text(
          text, style: context.theme.textTheme.bodySmall?.copyWith(
              color: context.theme.colors.green
          ),
        )
    );
  }
  
}
