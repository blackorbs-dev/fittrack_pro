import 'package:fittrack_pro/features/workout/domain/repository/workout_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/workout/data/repository/workout_repository_impl.dart';

class DependencyContainer extends StatelessWidget{
  const DependencyContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<WorkoutRepository>(
        create: (_) => WorkoutRepositoryImpl(),
        dispose: (repository) => repository.dispose(),
        child: child,
    );
  }

}