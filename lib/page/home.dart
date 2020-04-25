
import 'package:flutter/material.dart';
import 'package:toko_apk/page/base_view.dart';
import 'package:toko_apk/page/dasboard.dart';
import 'package:toko_apk/page/profile/menu_profile.dart';
import 'package:toko_apk/viewmodel/parent_view_model.dart';

class Homepage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<Homepage>{

  static int _currentState = 1;
  var pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {

    List<Widget> homeMenu()=> <Widget>[
      DashboardPage(),
      MenuProfile()
    ];

    List<BottomNavigationBarItem> bottomNavItem = [
      BottomNavigationBarItem(
        icon: Icon( Icons.format_list_bulleted,color: _currentState == 0 ? Colors.blue : Colors.black45),
        title: Text("Home"),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.business_center, color:  _currentState == 1 ? Colors.blue : Colors.black45),
          title: Text("Profile")
      )
    ];

    final BottomNavigationBar _navigationBar = BottomNavigationBar(
        currentIndex: _currentState,
        onTap: onPageChange,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black45,
        items: bottomNavItem);


    final Theme theme =  Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.blueAccent,
          textTheme: Theme.of(context).textTheme.copyWith(
            caption: new TextStyle(
              color: Colors.black
            )
          )
        ),
        child: _navigationBar);


    return SafeArea(child: Scaffold(
        body: SafeArea(child: PageView(
          controller: pagecontroller,
          children: homeMenu(),
          physics: NeverScrollableScrollPhysics(),
        ),
        ),
        bottomNavigationBar: theme,
      ),
    );
  }

  void onPageChange(int i){
    setState(() {
      pagecontroller.jumpToPage(i);
      _currentState = i;
    });
  }



}