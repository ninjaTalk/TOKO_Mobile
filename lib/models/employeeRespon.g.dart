// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employeeRespon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeRespon _$EmployeeResponFromJson(Map<String, dynamic> json) {
  return EmployeeRespon()
    ..status = json['status'] as String
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Employee.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$EmployeeResponToJson(EmployeeRespon instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};
