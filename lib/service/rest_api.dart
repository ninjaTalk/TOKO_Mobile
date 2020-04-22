import 'package:toko_apk/models/post.dart';
import 'package:toko_apk/models/employeeRespon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class RestClient{

  static String endpoint = 'https://jsonplaceholder.typicode.com';

  var client = new http.Client();

/**
 * ----------------------------- Test API ---------------------------------
 * */



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