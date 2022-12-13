import 'package:flutter/material.dart';
import 'package:games_on/pages/authentication/loginpage.dart';
import 'package:games_on/pages/home_screen/groundslist.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PaasswordModalsheet extends StatefulWidget {
  final String number;
  PaasswordModalsheet(this.number);

  @override
  State<PaasswordModalsheet> createState() => _PaasswordModalsheetState();
}

var code = "";

class _PaasswordModalsheetState extends State<PaasswordModalsheet> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _userpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 7, 242, 57)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Positioned(
      child: Container(
        height: 620.4,
        width: 420.50,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 2,
            child: Container(
              margin: EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      "Enter OTP",
                    ),
                    Text(
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                        textAlign: TextAlign.center,
                        "OTP send to ${widget.number}"),
                    SizedBox(
                      height: 20,
                    ),
                    Pinput(
                      length: 6,
                      onChanged: (value) {
                        code = value;
                      },
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) => print(pin),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                        onPressed: () async {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: Login.verify, smsCode: code);

                          // Sign the user in (or link) with the credential
                          await auth.signInWithCredential(credential);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GroundsList()),
                          );
                        },
                        child: Text('Login'))
                  ],
                ),
              ),
            )),
      ),
      top: 250,
      left: -3.5,
    );
  }
}
