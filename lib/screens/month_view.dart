import 'package:flutter/material.dart';
import 'package:every_day/widgets/day_button.dart';

class MonthView extends StatelessWidget {
  final int month;
  final int year;

  const MonthView({super.key, required this.month, required this.year});

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateTime(year, month + 1, 0).day;

    return Scaffold(
      appBar: AppBar(title: Text('Goals of $month/$year')),
      body: GridView.builder(
        padding: EdgeInsets.all(40.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 13,
          mainAxisSpacing: 13,
        ),
        itemCount: daysInMonth,
        itemBuilder: (_, index) {
          final date = DateTime(year, month, index + 1);
          return DayButton(date: date, size: 40.0);
        },
      ),
    );
  }
}
