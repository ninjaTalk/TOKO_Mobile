import 'package:flutter/material.dart';
import 'package:toko_apk/service/view_state.dart';

class BaseViewModel extends ChangeNotifier{
  ViewState _state =ViewState.Idle;
  AuthStatus _authStatus = AuthStatus.Logged_Out;

  ViewState get state => _state;
  AuthStatus get auth => _authStatus;

  void setState(ViewState viewState){
    _state = viewState;
    notifyListeners();
  }

  void setAuth(AuthStatus authStatus){
    _authStatus = authStatus;
    notifyListeners();
  }
}