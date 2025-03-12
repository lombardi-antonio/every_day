import 'package:flutter/material.dart';
import 'package:every_day/providers/goal_provider.dart';
import 'package:every_day/screens/year_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GoalProvider(),
      child: MaterialApp(
        title: 'Every Day Goal Calendar',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          scaffoldBackgroundColor: Colors.grey.shade900,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey.shade900,
            foregroundColor: Colors.amber.shade200,
          ),
        ),
        home: YearView(),
      ),
    );
  }
}
