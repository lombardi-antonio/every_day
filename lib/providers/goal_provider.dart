import 'package:flutter/material.dart';
import '../models/goal_day.dart';

class GoalProvider with ChangeNotifier {
  final Map<DateTime, GoalDay> _days = {};

  GoalDay getDay(DateTime date) {
    return _days.putIfAbsent(date, () => GoalDay(date: date));
  }

  void toggleGoalCompletion(DateTime date) {
    final day = getDay(date);
    day.isCompleted = !day.isCompleted;
    notifyListeners();
  }
}