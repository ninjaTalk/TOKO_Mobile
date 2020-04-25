import 'package:shared_preferences/shared_preferences.dart';
import 'package:toko_apk/models/member.dart';
import 'package:toko_apk/models/memberResponse.dart';
import 'package:toko_apk/models/post.dart';
import 'package:toko_apk/service/authentification.dart';
import 'package:toko_apk/service/rest_api.dart';
import 'package:toko_apk/service/view_state.dart';
import 'package:toko_apk/viewmodel/base_view_model.dart';
import 'package:toko_apk/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toko_apk/config/config_app.dart';


class LoginViewModel extends BaseViewModel{
  RestClient _api = locator<RestClient>();

  Post postData;

  FirebaseUser user;

  Member member;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool isLogin = false;

  String errorMessage;

  String token;

  Future login(Map<String, dynamic> dataMember) async{
    setState(ViewState.Busy);
      MemberResponse memberResponse = await _api.login(dataMember);
      member = memberResponse.data;
      if(!memberResponse.success){
        setState(ViewState.Idle);
        errorMessage = memberResponse.message;
        return memberResponse.success;
      }
      if(memberResponse.success) {
        _api.sp = await SharedPreferences.getInstance();
        _api.sp.setString(ConfigApp.API_KEY, member.token);
      }
    setState(ViewState.Idle);
    return memberResponse.success;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser _user = await _firebaseAuth.currentUser();
     user = _user;
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}