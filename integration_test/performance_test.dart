
import 'package:fittrack_pro/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:fittrack_pro/features/workout/presentation/bloc/workout_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

import 'app_test.dart';

class MockDashboardCubit extends Mock implements DashboardCubit {}
class MockWorkoutBloc extends Mock implements WorkoutBloc {}

void main(){
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  binding.testTextInput.register();


  testWidgets('end-to-end performance test', (tester) async{
    await binding.traceAction(() async{
      await runAppTest(tester);
    }, reportKey:  "app_performance_main");

  });

}