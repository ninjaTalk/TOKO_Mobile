import 'package:get_it/get_it.dart';
import 'package:toko_apk/service/rest_api.dart';
import 'package:toko_apk/viewmodel/base_view_model.dart';
import 'package:toko_apk/viewmodel/home_view_model.dart';
import 'package:toko_apk/viewmodel/login_view_model.dart';




GetIt locator = GetIt.instance;
void setupLocator(){

  locator.registerLazySingleton(()=>RestClient());

  locator.registerFactory(()=>LoginViewModel());
  locator.registerFactory(()=>HomeViewModel());
}