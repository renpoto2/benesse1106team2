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
  //DateTime _testDay = DateTime.now().add(Duration(days: 24));
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;
  Map<DateTime, List> _eventsList = {};

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;

    _eventsList = {

      //DateTime.now().add(Duration(days: 1)): ['Event A8', 'Event B8', 'Event C8', 'Event D8'],
      //DateTime.now().add(Duration(days: 3)): Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      DateTime.now().add(Duration(days: 2)): ['P30', 'P31'],
      DateTime.now().add(Duration(days: 3)): ['P32', 'P33'],
      DateTime.now().add(Duration(days: 4)): ['P34','P35'],
      DateTime.now().add(Duration(days: 5)): ['P36', 'P37'],
      DateTime.now().add(Duration(days: 6)): ['P38', 'P39'],
      DateTime.now().add(Duration(days: 7)): ['P40', 'P41'],
      DateTime.now().add(Duration(days: 8)): ['P42', 'P43'],
      DateTime.now().add(Duration(days: 9)): ['P44', 'P45'],
      DateTime.now().add(Duration(days: 10)): ['P46', 'P47'],
      DateTime.now().add(Duration(days: 11)): ['P48', 'P49'],
      DateTime.now().add(Duration(days: 12)): ['P50','P51'],
      DateTime.now().add(Duration(days: 13)): ['P52', 'P53'],
      DateTime.now().add(Duration(days: 14)): ['P54','P55'],
      DateTime.now().add(Duration(days: 15)): ['P56', 'P57'],
      DateTime.now().add(Duration(days: 16)): ['P58', 'P59'],
      DateTime.now().add(Duration(days: 17)): ['予想テスト①'],
      DateTime.now().add(Duration(days: 18)): ['ニガテ'],
      DateTime.now().add(Duration(days: 19)): ['予想テスト②'],
      DateTime.now().add(Duration(days: 20)): ['ニガテ'],
      DateTime.now().add(Duration(days: 21)): ['予想テスト③'],
      DateTime.now().add(Duration(days: 22)): ['ニガテ'],



    };
    // if (testDate != null && workName != null && pageNum != null) {
    //   List _testDate = testDate;
    //   List _workName = workName;
    //   List _pageNum = pageNum;
    //
    //   debugPrint(_testDate.last);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List _getEventForDay(DateTime day) {
      return _events[day] ?? [];
    }



    return Scaffold(
        backgroundColor: Colors.white,
        // Appbar
        appBar: AppBar(


          backgroundColor: Colors.indigo.shade200,

          title: Text(
            'Schedule', style: TextStyle(fontSize: 40,color: Colors.white),

          ),
          actions: [
            IconButton(
              onPressed: () {

                // （1） 指定した画面に遷移する
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        // （2） 実際に表示するページ(ウィジェット)を指定する
                        builder: (context) => schedule2()));
              },
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            )
          ],
        ),


        body: Container(
              child:SingleChildScrollView(
                  child: Column(
                    children: [
                      TableCalendar(
                        firstDay: DateTime.utc(2020, 1, 1),
                        lastDay: DateTime.utc(2030, 12, 31),
                        focusedDay: _focusedDay,//起動時画面
                        eventLoader: _getEventForDay,


                        calendarFormat: _calendarFormat,
                        /*
                        //以下、追記部分。
                        // フォーマット変更のボタン押下時の処理

                        onFormatChanged: (format) {
                          if (_calendarFormat != format) {
                            /*setState(() {
                              _calendarFormat = format;
                            });*/
                          }
                        },*/

                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                        ),


                        selectedDayPredicate: (day) {
                          //以下追記部分
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
                      Container(
                        height: 100,
                      ),
                      Container(
                        width: 500,
                        color: Colors.indigo.shade200,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.check_box,
                                size: 30.0,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("ToDo",style:TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white

                              ),),
                            ),
                          ],
                        ),


                      ),
                      Container(
                        width: 500,
                        color: Colors.indigo.shade50,
                        child: ListView(
                          shrinkWrap: true,
                          children: _getEventForDay(_selectedDay!)
                              .map((event) => ListTile(
                            title: Text("・"+event.toString(),
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 25,

                              ),),
                          ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
              ),





              ),






        );
  }
}
List _testDate = testDate;
List _workName = workName;
List _pageNum = pageNum;

