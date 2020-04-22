import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee {
    Employee();

    String id;
    String employee_name;
    String employee_salary;
    String employee_age;
    String profile_image;
    
    factory Employee.fromJson(Map<String,dynamic> json) => _$EmployeeFromJson(json);
    Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
