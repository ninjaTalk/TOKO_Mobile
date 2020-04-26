import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:toko_apk/service/rest_api.dart';
import 'package:toko_apk/viewmodel/home_view_model.dart';
import 'base_view.dart';
import 'package:toko_apk/service/view_state.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  RestClient _api;
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
                            items: model.products.map((f) {
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
                                              image:CachedNetworkImageProvider("https://aea2719e.ngrok.io${f.image}"),
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
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: <Widget>[

                                                  Container(
                                                    width: MediaQuery.of(context).size.width/2,
                                                    height: 50,
                                                    child:
                                                    Text("${f.name}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                                                  ),

                                                  Align(
                                                        alignment: Alignment.topLeft,
                                                        child:
                                                        Text("${f.detail}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                                                      ),
                                                ],
                                              ),
                                            ),


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
