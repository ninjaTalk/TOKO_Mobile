import 'package:json_annotation/json_annotation.dart';
import "employee.dart";
part 'employeeRespon.g.dart';

@JsonSerializable()
class EmployeeRespon {
    EmployeeRespon();

    String status;
    List<Employee> data;
    
    factory EmployeeRespon.fromJson(Map<String,dynamic> json) => _$EmployeeResponFromJson(json);
    Map<String, dynamic> toJson() => _$EmployeeResponToJson(this);
}
