import 'package:flutter/material.dart';

class CategoryModel {
  String? code;
  String? description;
  TextEditingController cCode = TextEditingController();
  TextEditingController cDescription = TextEditingController();
  CategoryModel({this.code, this.description});

  factory CategoryModel.fromJson(Map<String, dynamic> json,
      {String? code, String? description}) {
    return CategoryModel(
      code: json['code'],
      description: json['description'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'description': description,
    };
  }

  Map<String, dynamic> getFromControllerToJson() {
    code = cCode.text;
    description = cDescription.text;
    return {
      'code': code,
      'description': description,
    };
  }
}