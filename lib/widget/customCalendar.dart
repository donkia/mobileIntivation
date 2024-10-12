import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime focusedDay = DateTime(2025, 1, 1);
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TableCalendar(
        firstDay: DateTime.utc(2025, 1, 1),
        lastDay: DateTime.utc(2025, 1, 31),
        focusedDay: focusedDay,
        selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            this.selectedDay = selectedDay;
            this.focusedDay = focusedDay;
          });
        },
        calendarStyle: const CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            outsideDaysVisible: false,
            markerDecoration:
                BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            defaultDecoration: BoxDecoration(shape: BoxShape.rectangle)),
        headerStyle: const HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          leftChevronVisible: false,
          rightChevronVisible: false,

          // titleTextStyle는 사용하지 않고 customHeaderBuilder를 사용
        ),
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            if (day.day == 18 && day.month == 1 && day.year == 2025) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.red[200], // 강조할 배경색
                  shape: BoxShape.circle, // 원형으로 강조
                ),
                child: Center(
                  child: Text(
                    '${day.day}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }
            return Center(
              child: Text(
                '${day.day}',
                style: day.weekday == DateTime.sunday
                    ? const TextStyle(
                        color: Colors.red,
                      )
                    : const TextStyle(
                        color: Colors.black,
                      ),
              ),
            );
          },
        ),
        headerVisible: true,
        daysOfWeekVisible: true,
        onHeaderTapped: (date) {
          // 사용자가 헤더를 클릭했을 때의 동작을 정의할 수 있습니다.
        },
      ),
    );
  }

  Widget customHeaderBuilder(BuildContext context, DateTime date) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        '${date.year}년 ${date.month}월',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
