import 'dart:convert';
import 'package:http/http.dart';
import 'package:shop_constanst/page/categories/category_model.dart';
import '../../shared/services/basic_service.dart';
import '../../shared/storage/local_storage.dart';

class CategoryService {
  Future<dynamic> login(CategoryModel model) async {
    BasicService service = BasicService();
    String url = '/auth/login';
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