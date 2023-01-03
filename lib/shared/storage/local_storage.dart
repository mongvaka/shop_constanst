import 'package:localstorage/localstorage.dart';

class LocalStorageCustom {
  bool isLoggedIn() {
    String token = getToken();
    if (token != '') {
      return true;
    } else {
      return false;
    }
  }

  final LocalStorage storage =  LocalStorage('shopConstant');

  String userName = 'USER_NAME';
  String userId = 'USER_ID';
  String companyId = 'COMPANY_ID';
  String companyName = 'COMPANY_NAME';
  String token = 'TOKEN';

  LocalStorageCustom();

  String getToken() {
    return storage.getItem(token)??'';
  }
  String getUserId() {
    return storage.getItem(userId)??'';
  }
  String getUserName() {
    return storage.getItem(userName)??'';
  }
  String getCompanyId() {
    return storage.getItem(userName)??'';
  }
  String getCompanyName() {
    return storage.getItem(userName)??'';
  }

  setToken(String value) {
    storage.setItem(token, value);
  }
  setUserId(String value) {
    storage.setItem(userId, value);
  }
  setUserName(String value) {
    storage.setItem(userName, value);
  }
  setCompanyId(String value) {
    storage.setItem(companyId, value);
  }
  setCompanyName(String value) {
    storage.setItem(companyName, value);
  }
}
