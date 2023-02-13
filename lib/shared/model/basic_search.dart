import 'package:flutter/material.dart';

class BasicSearchModel {
  String? text;
  String? page;
  String? sortBy;
  String? orderBy;
  String? query= '';
  String? size;
  bool? deleted = false;
  bool? active = true;
  TextEditingController cText = TextEditingController();
  TextEditingController cPage = TextEditingController();
  TextEditingController cSortBy = TextEditingController();
  TextEditingController cOrderBy = TextEditingController();
  TextEditingController cSize = TextEditingController();
  BasicSearchModel({this.text, this.page,this.sortBy = 'createdAt',this.orderBy = 'ASC',this.size='10'});

  factory BasicSearchModel.fromJson(Map<String, dynamic> json,
      {String? code, String? description}) {
    return BasicSearchModel(
      text: json['text'],
      page: json['page'],
      sortBy: json['sortBy'],
      orderBy: json['orderBy'],
      size: json['size'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'page': page,
      'sortBy': sortBy,
      'orderBy': orderBy,
      'size': size,
    };
  }

  Map<String, dynamic> getFromControllerToJson() {
    text = cText.text;
    page = cPage.text ;
    // sortBy = cSortBy.text;
    // orderBy = cOrderBy.text;
    size = cSize.text;
    return {
      'text': cText.text,
      'page': cPage.text,
      'sortBy': cSortBy.text,
      'orderBy': cOrderBy.text,
      'size': cSize.text,
    };
  }
}