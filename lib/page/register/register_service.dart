import 'dart:convert';

import 'package:shop_constanst/page/register/register_model.dart';
import 'package:http/http.dart';
import '../../shared/services/basic_service.dart';
import '../../shared/storage/local_storage.dart';

class RegisterService {
  Future<dynamic> register(RegisterModel model) async {
    BasicService service = BasicService();
    String url = '/auth/register';
    Response res = await service.post(url, model.getFromControllerToJson());
    if (res != null) {
      dynamic body = jsonDecode(res.body);
      LocalStorageCustom localStorageCustom =  LocalStorageCustom();
      // await localStorageCustom
      //     .setDataLogin(LocalStorageItemView.fromJson(body));
      // print(localStorageCustom.getAccess_token());
      // Fluttertoast.showToast(
      //     msg: 'login success',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      return true;
    } else {
      return false;
    }
  }
}