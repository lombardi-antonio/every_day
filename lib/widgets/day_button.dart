import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/goal_provider.dart';

class DayButton extends StatelessWidget {
  final DateTime date;
  final double size;
  final VoidCallback? onTap;

  const DayButton({
    super.key,
    required this.date,
    this.size = 40.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final goalProvider = Provider.of<GoalProvider>(context);
    final isCompleted = goalProvider.getDay(date).isCompleted;

    return GestureDetector(
      onTap:
          onTap ??
          () async {
            goalProvider.toggleGoalCompletion(date);
            HapticFeedback.heavyImpact();
          },
      child: AnimatedContainer(
        duration: Duration(microseconds: 250),
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: isCompleted ? Colors.amberAccent : _getBackgroundColor(),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            if (isCompleted)
              BoxShadow(color: Colors.amber.shade100, blurRadius: 4),
          ],
        ),
        height: size,
        width: size,
        child: Center(
          child: Text(
            '${date.day}',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (_isToday()) {
      return Colors.grey.shade500;
    }
    return Colors.grey.shade800;
  }

  bool _isToday() {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}
