import 'package:flutter/material.dart';

class LoginModel {
  String? user;
  String? password;
  TextEditingController cUser = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  LoginModel({this.user, this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json,
      {String? user, String? password}) {
    return LoginModel(
      user: json['user'],
      password: json['password'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'password': password,
    };
  }

  Map<String, dynamic> getFromControllerToJson() {
    user = cUser.text;
    password = cPassword.text;
    return {
      'user': user,
      'password': password,
    };
  }
}