import 'package:fittrack_pro/core/theme/extensions.dart';
import 'package:fittrack_pro/features/dashboard/domain/models/chart_type.dart';
import 'package:fittrack_pro/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ChartItem extends StatelessWidget{
  const ChartItem({super.key, required this.type, required this.icon, required this.title, required this.isSelected});

  final ChartType type;
  final String title;
  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.read<DashboardCubit>().setChart(type);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        margin: const EdgeInsets.only(bottom: 16, right: 8),
        decoration: BoxDecoration(
            color: isSelected ? context.theme.colors.primary : context.theme.colors.black,
            borderRadius: BorderRadius.circular(22),
            border: isSelected ? null : Border.all(color: context.theme.colors.darkMutedForeground)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(icon, width: 18, height: 18,),
            SizedBox(width: 4,),
            Text(
              title, style: context.theme.textTheme.bodySmall
                .withColor(context.theme.colors.lightForeground),
            )
          ],
        ),
      ),
    );
  }

}