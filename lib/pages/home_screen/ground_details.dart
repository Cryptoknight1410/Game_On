import "package:flutter/material.dart";

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
                            "Ground Detail",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            )
          ]),
        )));
  }
}
