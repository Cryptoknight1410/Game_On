import 'package:flutter/material.dart';
import 'package:games_on/models/modelground.dart';

class GroundCards extends StatelessWidget {
  @override
  List<modelGround> stadiums = [
    modelGround(
        name: 'Wankhede International Stadium',
        image: 'assets/wankhede.jpg',
        location: 'Mumbai',
        pitchtype: 'Mat'),
    modelGround(
        name: 'Narendra Modi Stadium',
        image: 'assets/narendraModi.jpg',
        location: 'Ahmedabad',
        pitchtype: 'Mat'),
    modelGround(
        name: 'DY Patil Stadium',
        image: 'assets/frontpage.jpg',
        location: 'Aurangabad',
        pitchtype: 'Mat')
  ];

  // final count = ;
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 650,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: stadiums.map((gg) {
          return Container(
            height: 203,
            // decoration: BoxDecoration(border: Border.all(width: 1)),
            width: 400,
            child: Card(
              elevation: 5,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                      width: 380,
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 1,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              // alignment: Alignment.topLeft,
                              gg.image,
                              height: 100,
                              width: 80,

                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 1),
                              alignment: Alignment.center,
                              height: 110,
                              width: 290,
                              child: Column(
                                children: [
                                  Text(
                                    textAlign: TextAlign.left,
                                    '20 Over',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        width: 100,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              print('Pressed');
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green),
                                            child: Text('10:00am')),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 100,
                                        child: ElevatedButton(
                                            onPressed: null,
                                            child: Text('2:00pm')),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    textAlign: TextAlign.left,
                                    '30 Over',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        width: 100,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              print('Pressed');
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green),
                                            child: Text('10:00am')),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 100,
                                        child: ElevatedButton(
                                            onPressed: null,
                                            child: Text('2:00pm')),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 50)),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      gg.name,
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(left: 50)),
                    Text(gg.location),
                    Padding(padding: EdgeInsets.only(left: 50)),
                    Text("Pitch Type:${gg.pitchtype}"),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
