import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:toko_apk/page/base_view.dart';
import 'package:toko_apk/service/deep_link.dart';
import 'package:toko_apk/service/view_state.dart';
import 'package:toko_apk/viewmodel/login_view_model.dart';
import 'package:share/share.dart';

class MenuProfile extends StatefulWidget{
  @override
  _MenuProfileState createState() => _MenuProfileState();

}

class _MenuProfileState extends State<MenuProfile>{

  LoginViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      onModelReady: (model){
        model.getCurrentUser();
        viewModel = model;
      },
      builder: (context, model, child)=>Scaffold(
        appBar: new AppBar(
          elevation: 5,
          title: Text("Profile"),
        ),
        body: model.state == ViewState.Busy ? Center(child: RefreshProgressIndicator(),) : Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    //heightFactor: 1.4,
                    child: Container(
                        margin: EdgeInsets.only(bottom: 0, top: 20.0),
                        padding: EdgeInsets.all(10),
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 3.5),
                                blurRadius: 6.0
                            )],
                            borderRadius: BorderRadius.circular(90)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: CachedNetworkImage(
                            imageUrl: "",
                            errorWidget: (context, url, error)=> Image.asset("assets/user/admin.jpg"),
                            fit: BoxFit.cover,
                          ),
                        )
                    ),
                  ),
                  Container(width:MediaQuery.of(context).size.width,padding: EdgeInsets.all(20),child: Text("${model?.user?.email??""}", textAlign: TextAlign.center,),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                    child: GestureDetector(
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blueAccent,
                      ),
                    )
                ),
                Expanded(
                  flex: 1,
                    child: GestureDetector(
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green,
                      ),
                    )
                ),
              ],
            ),
            menuItem("Licence", Icon(Icons.announcement), toLisenci),
            menuItem("DeepLink", Icon(Icons.link), toDeepLink),
            menuItem("Logout", Icon(Icons.exit_to_app), toLogin)
          ],
        ),
      ),
    );
  }

  void toLogin(){
    Navigator.pop(context);
  }

  void toLisenci(){

  }

  void toDeepLink() async{
    String url = await DeepLink.createDynamicLink('v=bMzMOyk_1xY', true);
    print(url);
    Share.share("${viewModel.postData.title} \n\n cek Selengkapnya di : ${url}");
  }
  
  Widget menuItem(String text, Widget icon, callback)=>InkWell(
    onTap: callback,
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1)
        )
      ),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          icon,
          Container(
            padding: EdgeInsets.all(5),
            child: Text("${text}",style: TextStyle(fontWeight: FontWeight.w700), textAlign: TextAlign.left,),
          )
        ],
      ),
    ),
  );
}