import 'package:flutter/material.dart';
import 'package:games_on/main.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:games_on/widgets/groundcards.dart';

class GroundsList extends StatefulWidget {
  const GroundsList({super.key});

  @override
  State<GroundsList> createState() => _GroundsListState();
}

DatePickerController _controller = DatePickerController();

DateTime _selectedValue = DateTime.now();

class _GroundsListState extends State<GroundsList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            height: double.infinity,
            child: Column(children: [
              Container(
                height: 80,
                width: double.infinity,
                // color: Color.fromARGB(255, 5, 91, 8),
                child: Card(
                  color: Color.fromARGB(255, 5, 91, 8),
                  elevation: 10,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(top: 15),
                    child: Row(children: [
                      Container(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            Text(
                              "Grounds",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: DatePicker(
                        DateTime.now(),
                        width: 60,
                        height: 90,
                        controller: _controller,
                        initialSelectedDate: DateTime.now(),
                        selectionColor: Color.fromARGB(255, 15, 168, 15),
                        selectedTextColor: Colors.white,
                        onDateChange: (date) {
                          // New date selected
                          setState(() {
                            _selectedValue = date;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              GroundCards()
            ]),
          ),
        ));
  }
}
