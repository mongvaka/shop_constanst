import 'package:flutter/material.dart';

class CategoryModel {
  String? id;
  String? code;
  String? name;
  TextEditingController cCode = TextEditingController();
  TextEditingController cName = TextEditingController();
  List<GlobalKey<FormState>> formKey = [];

  CategoryModel({this.code, this.name, this.id}){
    cCode.text = this.code??'';
    cName.text = this.name??'';
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json,
      {String? code, String? description,String? id}) {
    return CategoryModel(
      code: json['code'],
      name: json['name'],
      id: json['id'],
    );
  }
  Map<String, dynamic> toJson() {
    code = this.cCode.text;
    name = this.cName.text;
    return {
      'code': code,
      'name': name,
    };
  }

  Map<String, dynamic> getFromControllerToJson() {
    code = cCode.text;
    name = cName.text;
    return {
      'code': code,
      'name': name,
    };
  }
}