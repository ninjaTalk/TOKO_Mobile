import 'package:flutter/material.dart';
import 'package:toko_apk/viewmodel/home_view_model.dart';
import 'base_view.dart';
import 'package:toko_apk/service/view_state.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) {
        model.main();
      },
      builder: (context, model, child) => Scaffold(
        appBar: new AppBar(
          title: Text("Home"),
        ),
        body: model.state == ViewState.Busy
            ? Center(
                child: RefreshProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: CarouselSlider(
                          //viewportFraction: 1.0,
                          //aspectRatio: 5 / 2,
                            autoPlay: true,
                            height: 150,
                            enlargeCenterPage: true,
                            items: model.employees.map((f) {
                              return Builder(
                                builder: (BuildContext conttext) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                                      //height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image:
                                              AssetImage("assets/bg/back.jpg"),
                                              fit: BoxFit.cover),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 3,
                                                offset: Offset(0.0, 1.5))
                                          ]
                                      ),

                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.grey.withOpacity(0.2),
                                                  Colors.black12
                                                ])),

                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: <Widget>[

                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                    Text("${f.employee_name}"),
                                                  ),

                                                  Expanded(
                                                      child: Align(
                                                        alignment: Alignment.topRight,
                                                        child:
                                                        Text("${f.employee_age}"),
                                                      )),
                                                ],
                                              ),
                                            ),

                                            Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text("${f.employee_salary}"),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList()),
                      )
                  ],
                ),
              ),
      ),
    );
  }
}
