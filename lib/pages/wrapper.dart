import 'package:flutter/material.dart';
import 'package:games_on/pages/authentication/loginpage.dart';
import "../pages/home_screen/ground_details.dart";
import 'package:games_on/pages/home_screen/groundslist.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //return login_page or Home as per the user is login or Not
    return Login();
  }
}
