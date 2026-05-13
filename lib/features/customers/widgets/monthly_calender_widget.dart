import 'package:flutter/material.dart';
class MonthlyCalendarWidget extends StatelessWidget {
  final DateTime selectedDate;

  const MonthlyCalendarWidget({
    super.key,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    final int daysInMonth =
        DateTime(selectedDate.year, selectedDate.month + 1, 0).day;

    final DateTime firstDayOfMonth =
    DateTime(selectedDate.year, selectedDate.month, 1);

    // Monday = 1, Sunday = 7
    final int startingWeekday = firstDayOfMonth.weekday;

    // Empty cells before day 1
    final int leadingEmptyDays = startingWeekday - 1;

    // Total cells = empty cells + actual days
    final int totalCells = leadingEmptyDays + daysInMonth;

    final List<String> weekDays = [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun',
    ];

    return Column(
      children: [

        // Weekday headers
        Row(
          children: weekDays.map((day) {
            return Expanded(
              child: Center(
                child: Text(
                  day,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 8),

        // Calendar grid
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalCells,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              // Empty cells before first day
              if (index < leadingEmptyDays) {
                return const SizedBox();
              }

              final int dayNumber = index - leadingEmptyDays + 1;
              final DateTime currentDate = DateTime(
                selectedDate.year,
                selectedDate.month,
                dayNumber,
              );
              final bool isPastDate = currentDate.isBefore(
                DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                ),
              );

              final bool isToday = _isSameDate(currentDate, DateTime.now());

              return Container(
                decoration: BoxDecoration(
                  color: isToday
                      ? Colors.blue
                      : isPastDate
                      ? (currentDate.day % 2 == 0
                      ? Colors.green.shade100
                      : Colors.red.shade100)
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isToday ? Colors.blue : Colors.grey.shade300,
                  ),
                ),
                child: Center(
                  child: Text(
                    '$dayNumber',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isToday ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year &&
        a.month == b.month &&
        a.day == b.day;
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return months[month - 1];
  }
}