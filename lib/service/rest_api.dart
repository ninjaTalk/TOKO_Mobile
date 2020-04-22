import 'package:toko_apk/models/memberResponse.dart';
import 'package:toko_apk/models/post.dart';
import 'package:toko_apk/models/employeeRespon.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class RestClient{

  static String endpoint = 'https://c99417a6.ngrok.io/api';

  var client = new http.Client();

  SharedPreferences sp;

/**
 * ----------------------------- Test API ---------------------------------
 * */

  Future<MemberResponse> login(Map<String, dynamic> dataMember) async{
    print("${dataMember["email"]}, ${dataMember["password"]}");
    var response = await client.post('$endpoint/login',
        body: {
          "email" : dataMember["email"],
          "password" : dataMember["password"],
        }
    );
    print(response.body);
    print('$endpoint/login');
    return MemberResponse.fromJson(json.decode(response.body));

  }

  Future<Post> getPost() async{
    var url = '$endpoint/posts/1';
    var response =  await client.get(url);
    print(response.body);
    return Post.fromJson(jsonDecode(response.body));
  }

  Future<EmployeeRespon> getEmployee() async{
    var url = "http://dummy.restapiexample.com/api/v1/employees";
    var response = await client.get(url);
    return EmployeeRespon.fromJson(jsonDecode(response.body));
  }
}