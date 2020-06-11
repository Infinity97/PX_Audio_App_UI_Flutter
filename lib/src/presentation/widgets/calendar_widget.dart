import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';

class CalendarWidget extends StatefulWidget {

  @override
  CalendarWidgetState createState() => CalendarWidgetState();
}

class CalendarWidgetState extends State<CalendarWidget> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: CalendarCarousel<Event>(
        headerTextStyle: TextStyle(
            color: ColorConstants.gradientOrangeEnd,
            fontWeight: FontWeight.w900,
            fontSize: SizeConfig.blockSizeVertical * 5),
        iconColor: ColorConstants.gradientOrangeEnd,
        minSelectedDate: DateTime(DateTime.now().year - 2),
        maxSelectedDate: DateTime(DateTime.now().year + 2),
        onDayPressed: (DateTime date, List<Event> events) {
          this.setState(() => _selectedDate = date);
          print(_selectedDate);
        },
        weekendTextStyle: TextStyle(
          color: Colors.red,
        ),
        thisMonthDayBorderColor: Colors.grey,
        weekFormat: false,
        height: 420.0,
        selectedDateTime: _selectedDate,
        daysHaveCircularBorder: true,
      ),
    );
  }
}