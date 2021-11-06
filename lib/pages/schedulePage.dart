
import 'dart:collection';
//import 'dart:html';
import 'schedule_2.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class scheduleScreen extends StatefulWidget {

  @override
  _scheduleScreenState createState() => _scheduleScreenState();
}


class _scheduleScreenState extends State<scheduleScreen> {
  // This widget is the root of your application.
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;
  Map<DateTime, List> _eventsList = {};

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }


  @override

  void initState(){
    super.initState();
    _selectedDay = _focusedDay;

    _eventsList = {
      DateTime.now().subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      DateTime.now(): ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      DateTime.now().add(Duration(days: 1)): [
        'Event A8',
        'Event B8',
        'Event C8',
        'Event D8'
      ],
      DateTime.now().add(Duration(days: 3)):
      Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      DateTime.now().add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
      DateTime.now().add(Duration(days: 11)): ['Event A11', 'Event B11'],
      DateTime.now().add(Duration(days: 17)): [
        'Event A12',
        'Event B12',
        'Event C12',
        'Event D12'
      ],
      DateTime.now().add(Duration(days: 22)): ['Event A13', 'Event B13'],
      DateTime.now().add(Duration(days: 26)): [
        'Event A14',
        'Event B14',
        'Event C14'
      ],

    };
  }






  @override
  Widget build(BuildContext context) {

    final _events = LinkedHashMap<DateTime, List>(
      equals:  isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List _getEventForDay(DateTime day){
      return _events[day] ?? [];
    }


    return Scaffold(
        backgroundColor: Colors.green[100],
        // Appbar
        appBar: AppBar(

          backgroundColor: Colors.green.shade100,

          title: Text(
            'Book', style: TextStyle(fontSize: 16),
          ),
          actions: [IconButton(onPressed: (){
            // （1） 指定した画面に遷移する
            Navigator.push(context, MaterialPageRoute(
              // （2） 実際に表示するページ(ウィジェット)を指定する
                builder: (context) => schedule2()
            ));
          }, icon:Icon(Icons.face, color: Colors.white,),
          )
          ],
        ),
        body: Column(

          children: [
            Text("data"),



            // Text(pageNum[0]/(7)),


          ],
        ),


        body:Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              eventLoader: _getEventForDay,
              calendarFormat: _calendarFormat,          //以下、追記部分。
              // フォーマット変更のボタン押下時の処理
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
              ),
              selectedDayPredicate: (day) {      //以下追記部分
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                  _getEventForDay(selectedDay);
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            //以下追記
            ListView(
              shrinkWrap: true,
              children: _getEventForDay(_selectedDay!)
                  .map((event) => ListTile(
                title: Text(event.toString()),
              ))
                  .toList(),
            )


          ],
        )


    );






  }


}

