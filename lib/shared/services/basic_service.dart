import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../storage/local_storage.dart';

class BasicService {
  Future<Response> post(
      String url, dynamic searchParameter) async {
    String authorization = getAuthorization();
    String apiUrl = 'http://10.0.2.2:5001/api$url';
    Map model = searchParameter.toJson();
    Response res = await http.post(Uri.parse(apiUrl),
        body: jsonEncode(model),
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
