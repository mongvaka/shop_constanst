import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shop_constanst/shared/model/basic_search.dart';

import '../storage/local_storage.dart';

class BasicService {
  Future<Response> patch(
      String url, dynamic model) async {
    String authorization = getAuthorization();
    String apiUrl = 'http://203.159.93.42/api/v1$url';
    Map m = model.toJson();
    Response res = await http.patch(Uri.parse(apiUrl),
        body: m,
        headers: {'authorization': authorization},
        encoding: Encoding.getByName("utf-8"));
    return res;
  }
  Future<Response> post(
      String url, dynamic model) async {
    String authorization = getAuthorization();
    String apiUrl = 'http://203.159.93.42/api/v1$url';
    Map m = model.toJson();
    Response res = await http.post(Uri.parse(apiUrl),
        body: m,
        headers: {'authorization': authorization},
        encoding: Encoding.getByName("utf-8"));
    return res;
  }
  Future<Response> get(
      String url, BasicSearchModel model) async {
    model.getFromControllerToJson();
    String authorization = getAuthorization();
    String apiUrl = 'http://203.159.93.42/api/v1$url?deleted=${model.deleted}&active=${model.active}&text=${model.text}&page=${model.page}&query=${model.query}&sortBy=${model.sortBy}&orderBy=${model.orderBy}&size=${model.size}';
    // Map model = searchParameter.toJson();
    Response res = await http.get(Uri.parse(apiUrl),
        headers: {'authorization': authorization},
        );
    return res;
  }
  Future<Response> delete(
      String url, String id) async {
    String authorization = getAuthorization();
    String apiUrl = 'http://203.159.93.42/api/v1$url/$id';
    Response res = await http.delete(Uri.parse(apiUrl),
        headers: {'authorization': authorization},
        encoding: Encoding.getByName("utf-8"));
    return res;
  }
  String getAuthorization() {
    LocalStorageCustom localStorageCustom = LocalStorageCustom();
    String token = localStorageCustom.getToken();
    return token;
  }
}
