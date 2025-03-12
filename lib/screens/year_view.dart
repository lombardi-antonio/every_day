import 'package:flutter/material.dart';
import 'package:every_day/screens/month_view.dart';
import 'package:every_day/widgets/day_button.dart';

class YearView extends StatelessWidget {
  final int currentYear = DateTime.now().year;

  YearView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(12, (monthIndex) {
                    final daysInMonth =
                        DateTime(currentYear, monthIndex + 2, 0).day;

                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            "${(monthIndex + 1)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.amber.shade200,
                            ),
                          ),
                        ),
                        Column(
                          children: List.generate(daysInMonth, (dayIndex) {
                            final date = DateTime(
                              currentYear,
                              monthIndex + 1,
                              dayIndex + 1,
                            );

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                              ),
                              child: DayButton(
                                date: date,
                                size: 21.0,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => MonthView(
                                            month: date.month,
                                            year: date.year,
                                          ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  int get year => DateTime.now().year;
}
