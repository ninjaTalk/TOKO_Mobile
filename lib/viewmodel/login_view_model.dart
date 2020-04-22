import 'package:toko_apk/models/post.dart';
import 'package:toko_apk/service/authentification.dart';
import 'package:toko_apk/service/rest_api.dart';
import 'package:toko_apk/service/view_state.dart';
import 'package:toko_apk/viewmodel/base_view_model.dart';
import 'package:toko_apk/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginViewModel extends BaseViewModel{
  RestClient _api = locator<RestClient>();
  Post postData;
  BaseAuth _auth;
  Auth _resAuth;
  FirebaseUser user;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool isLogin = false;

  Future login(String email, String password) async{
    print("disini");
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    print(user.uid);
    if(user.uid!=null && user.uid.length>0){
      setAuth(AuthStatus.Logged_In);
    }
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser _user = await _firebaseAuth.currentUser();
     user = _user;
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }


  Future main() async{
    setState(ViewState.Busy);
    Post post = await _api.getPost();
    if(post != null){
      postData = post;
      isLogin = true;
    }else{
      isLogin = false;
    }
    setState(ViewState.Idle);
  }
}