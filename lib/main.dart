import 'package:fittrack_pro/di.dart';
import 'package:fittrack_pro/features/dashboard/presentation/pages/dashboard.dart';
import 'package:flutter/material.dart';

import 'core/theme/colors.dart';
import 'core/theme/type.dart';

void main() {
  runApp(const DependencyContainer(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitTrack Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black
        ),
        extensions: [ const AppColors() ],
        textTheme: textTheme,
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

