import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/passwordmodalsheet.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Login extends StatefulWidget {
  // const Login({super.key});

  static String verify = "";
  @override
  State<Login> createState() => _LoginState();
}

@override
int flag = 0;

final _usernumber = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Stack(
        children: [
          Container(
              child: Image.asset(
            'assets/frontpage.jpg',
            fit: BoxFit.fitHeight,
            height: 400,
          )),
          Container(
              height: 400,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromRGBO(8, 143, 130, 0.607),
                Color.fromARGB(220, 6, 10, 10)
              ]))),
          Positioned(
            top: 70,
            left: 118,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      'assets/logo.png',
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Coiny',
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    "GAME ON",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          flag == 0
              ? Positioned(
                  child: Container(
                    height: 625.4,
                    width: 420.50,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 2,
                        child: Container(
                          margin: EdgeInsets.all(30),
                          child: SingleChildScrollView(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  "Hi!",
                                ),
                                Text(
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                    textAlign: TextAlign.center,
                                    "Lets Get Started"),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 20,
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Enter your Phone Number",
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            style: BorderStyle.solid)),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          width: 40,
                                          child:
                                              Text("+91", style: TextStyle()),
                                        ),
                                        SizedBox(
                                          width: 10,
                                          child: Text(
                                            "|",
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ),
                                        Expanded(
                                            child: TextField(
                                          controller: _usernumber,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(),
                                        ))
                                      ],
                                    )),
                                SizedBox(height: 50),
                                ElevatedButton(
                                    onPressed: () async {
                                      await FirebaseAuth.instance
                                          .verifyPhoneNumber(
                                        phoneNumber: '+91 9819 748 940',
                                        verificationCompleted:
                                            (PhoneAuthCredential credential) {},
                                        verificationFailed:
                                            (FirebaseAuthException e) {},
                                        codeSent: (String verificationId,
                                            int? resendToken) {
                                          Login.verify = verificationId;
                                        },
                                        codeAutoRetrievalTimeout:
                                            (String verificationId) {},
                                      );
                                      setState(() {
                                        flag = 1;
                                      });
                                    },
                                    child: Text('Get Otp'))
                              ],
                            ),
                          ),
                        )),
                  ),
                  top: 250,
                  left: -3.5,
                )
              : PaasswordModalsheet(_usernumber.text)
        ],
      ),
    );
  }
}
