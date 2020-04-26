
import 'package:toko_apk/models/employee.dart';
import 'package:toko_apk/models/employeeRespon.dart';
import 'package:toko_apk/models/post.dart';
import 'package:toko_apk/models/product.dart';
import 'package:toko_apk/models/productPagingResponse.dart';
import 'package:toko_apk/service/rest_api.dart';
import 'package:toko_apk/viewmodel/base_view_model.dart';
import 'package:toko_apk/service/view_state.dart';
import 'package:toko_apk/locator.dart';
class HomeViewModel extends BaseViewModel{
  RestClient _api = locator<RestClient>();
  List<Employee> employees = [];
  List<Product> products = [];

  Future main()async{
    setState(ViewState.Busy);
//    EmployeeRespon datas = await _api.getEmployee();
//    if(datas.data!=null){
//      employees = datas.data;
//    }
    ProductPagingResponse response = await _api.getProductPaging();
    if(response.data!=null){
      products = response.data;
    }
    setState(ViewState.Idle);
  }
}