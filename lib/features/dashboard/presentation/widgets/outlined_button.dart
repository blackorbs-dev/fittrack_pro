import 'package:fittrack_pro/core/theme/extensions.dart';
import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget{
  const OutlineButton({super.key, required this.text, required this.color, this.onPressed});

  final String text;
  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          side: WidgetStateProperty.all(BorderSide(color: color)),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        ),
        child: Text(text, style: context.theme.textTheme.bodyMedium.withColor(color))
    );
    // return Container(
    //   width: double.infinity,
    //   padding: const EdgeInsets.all(12),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(12),
    //     border: Border.all(color: color)
    //   ),
    //   child: Center(child: Text(
    //     text, style: context.theme.textTheme.bodyMedium.withColor(color)
    //   )),
    // );
  }

}