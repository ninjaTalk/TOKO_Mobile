import 'package:flutter/material.dart';
import 'package:toko_apk/login.dart';
import 'package:toko_apk/home/homePage.dart';


class Navbar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => StateNavbar();
}

class StateNavbar extends State<Navbar> {

  static List<Widget> navMenu = <Widget>[
    LoginPage(),
    HomePage()
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
