import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _stateHomePage();
}
class _stateHomePage extends State<HomePage>{
  TextEditingController usernameController;
  TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Form(child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.only(top:15.0, bottom: 15.0, left: 20.0, right: 20.0),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        fillColor: Colors.red,
                        hintText: "username",
                        //focusColor: Colors.green,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        icon: Icon(Icons.supervised_user_circle),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide:BorderSide(
                              color: Colors.blue,
                              width: 1,
                            )
                        )
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0, right: 20.0, left: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key),
                        hintText: "password",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                                color: Colors.blue,
                                width: 1
                            )
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        )
                    ),
                  ),
                )
              ],
            ),)
        )
    );
  }

}