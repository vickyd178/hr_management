import 'package:flutter/material.dart';
import 'package:hr_management/common/app_color.dart';
import 'package:hr_management/common/dimensions.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:universal_html/html.dart' as ht;

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(Dimensions.getHeight(1.0)),
      ),
      padding: EdgeInsets.all(Dimensions.getHeight(1.0)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${DateFormat("MMM, yyyy").format(_focusedDay)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.getFontSize(2.0),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _focusedDay =
                            DateTime(_focusedDay.year, _focusedDay.month - 1);
                      });
                    },
                    child: Icon(
                      Icons.chevron_left,
                      color: AppColor.black,
                      size: Dimensions.getIconSize(2.4),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _focusedDay =
                            DateTime(_focusedDay.year, _focusedDay.month + 1);
                      });
                    },
                    child: Icon(
                      Icons.chevron_right,
                      color: AppColor.black,
                      size: Dimensions.getIconSize(2.4),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: Dimensions.getHeight(1.0),
          ),
          TableCalendar(
            availableGestures: AvailableGestures.horizontalSwipe,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2010),
            lastDay: DateTime.utc(2040),
            headerVisible: false,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekHeight: Dimensions.getHeight(1.6),
            onFormatChanged: (result) {},
            daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (date, locale) {
                return DateFormat("EEE").format(date).toUpperCase();
              },
              weekendStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.getFontSize(1.4),
              ),
              weekdayStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.getFontSize(1.4),
              ),
            ),
            onPageChanged: (day) {
              _focusedDay = day;
              setState(() {});
            },
            calendarStyle: CalendarStyle(
              defaultTextStyle:
                  TextStyle(fontSize: Dimensions.getFontSize(1.4)),
              selectedTextStyle: TextStyle(
                  fontSize: Dimensions.getFontSize(1.4), color: Colors.black),
              disabledTextStyle:
                  TextStyle(fontSize: Dimensions.getFontSize(1.4)),
              weekendTextStyle:
                  TextStyle(fontSize: Dimensions.getFontSize(1.4)),
              outsideTextStyle: TextStyle(
                  fontSize: Dimensions.getFontSize(1.2),
                  color: Colors.grey[400]),
              todayDecoration: BoxDecoration(
                color: AppColor.yellow,
                shape: BoxShape.circle,
              ),
              todayTextStyle: TextStyle(fontSize: Dimensions.getFontSize(1.4)),
              markerDecoration: BoxDecoration(
                color: AppColor.yellow,
                shape: BoxShape.circle,
              ),
            ),
            eventLoader: (day) {
              //make event on  22 day every month
              if (day.day == 22 || day.day == 12) {
                return [
                  ht.Event("Event Name", canBubble: true),
                ];
              }
              return [];
            },
          )
        ],
      ),
    );
  }
}
