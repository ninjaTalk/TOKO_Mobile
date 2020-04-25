import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toko_apk/config/config_app.dart';
import 'package:toko_apk/login.dart';
import 'package:toko_apk/page/home.dart';
import 'package:toko_apk/service/view_state.dart';
enum AuthStatus{ Logged_In, Logged_Out }
class AuthPage extends StatefulWidget{
  @override
  _AuthPageState createState() =>_AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
  AuthStatus _status = AuthStatus.Logged_Out;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMenu();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    switch(_status){
      case AuthStatus.Logged_In:
        return new Homepage();
        break;
      case AuthStatus.Logged_Out:
        return new LoginPage();
        break;
    }
    return new LoginPage();
  }
  getMenu() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(ConfigApp.API_KEY);
    if(token!=null){
      setState(() {
        _status = AuthStatus.Logged_In;
      });
    }else{
      _status =AuthStatus.Logged_Out;
    }

  }
}