import 'dart:convert';
import 'package:http/http.dart';
import 'package:shop_constanst/page/categories/category_model.dart';
import 'package:shop_constanst/shared/model/basic_respons.dart';
import 'package:shop_constanst/shared/model/basic_search.dart';
import '../../shared/services/basic_service.dart';
import '../../shared/storage/local_storage.dart';

class CategoryService {
  Future<dynamic> list(BasicSearchModel model) async {
    BasicService service = BasicService();
    String url = '/categories';
    Response res = await service.get(url, model);
    BasicResponseModel re = BasicResponseModel.fromJson(jsonDecode(res.body) ) ;
    return re;
  }
  Future<dynamic> delete(String id) async {
    BasicService service = BasicService();
    String url = '/categories';
    Response res = await service.delete(url,id);
    return jsonDecode(res.body);
  }
  Future<dynamic> create(CategoryModel model) async {
    BasicService service = BasicService();
    String url = '/categories';
    Response res = await service.post(url,model);
    return jsonDecode(res.body);
  }
  Future<dynamic> edit(CategoryModel model) async {
    BasicService service = BasicService();
    String url = '/categories/${model.id}';
    Response res = await service.patch(url,model);
    return jsonDecode(res.body);
  }
}