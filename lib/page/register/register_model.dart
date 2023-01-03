import 'package:flutter/material.dart';

class RegisterModel {
  String? user;
  String? password;
  String? confirmPassword;
  TextEditingController cUser = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController cConfirmPassword = TextEditingController();

  RegisterModel({this.user, this.password,this.confirmPassword});

  factory RegisterModel.fromJson(Map<String, dynamic> json,
      {String? user, String? password}) {
    return RegisterModel(
      user: json['user'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'password': password,
      'confirmPassword':confirmPassword
    };
  }

  Map<String, dynamic> getFromControllerToJson() {
    user = cUser.text;
    password = cPassword.text;
    return {
      'user': user,
      'password': password,
      'confirmPassword':confirmPassword
    };
  }
}