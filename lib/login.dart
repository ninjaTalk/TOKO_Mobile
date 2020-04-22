import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:toko_apk/page/base_view.dart';
import 'package:toko_apk/page/profile/menu_profile.dart';
import 'package:toko_apk/viewmodel/login_view_model.dart';
import 'package:toko_apk/service/view_state.dart';
import 'package:toko_apk/page/home.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _stateLoginPage();
}
class _stateLoginPage extends State<LoginPage>{
  TextEditingController usernameController;
  TextEditingController passwordController;
  String getEmail;
  String getPassword;

  setEmail(String email){
    if(email.length>0 && email!= null){
      setState(() {
        getEmail = email;
      });
    }
  }

  setPassword(String password){
    if(password.length>0 && password!= null){
      setState(() {
        getPassword = password;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      onModelReady: (model){
        model.main();
      },
      builder: (context, model, child)=>Scaffold(
          body: Form(
            child: Container(
                color: Colors.white,
                child: model.state == ViewState.Busy ? Center(child: RefreshProgressIndicator(),) : Form(child: ListView(
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
                        onChanged: (email){
                          setEmail(email);
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.red,
                            hintText: "email",
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
                        onChanged: (password){
                          setPassword(password);
                        },
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
                    ),
                    Padding(padding: EdgeInsets.all(20) ,
                      child: RaisedButton(
                          padding: EdgeInsets.only(bottom: 15.0, top: 15.0),
                          child: Text("Masuk", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),),
                          color: Colors.blueAccent,
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
                          onPressed: () async{
                            await model.login(getEmail, getPassword);
                            if(model.auth == AuthStatus.Logged_In){
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuProfile()));
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                            }else{
                              Toast.show("Yout account is not registry in out database", context, duration: 4);
                            }
                          }),)
                  ],
                ),)
            ),
          )
      ),
    );
  }

}