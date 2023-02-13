import '../model/basic_validate.dart';
class CustomValidate{
  List<BasicValidate> validateList = [];
   CustomValidate();
  add(String key,bool state){
    bool newModel = true;
    for (var element in validateList) {
      if(element.key == key){
        newModel = false;
        element.state = state;
      }
    }
    if(newModel){
      validateList.add(BasicValidate(key,state));
    }
  }
  bool isValid(){
    bool isValid = true;
    for (var element in validateList) {
      if(!element.state){
        isValid = false;
      }
    }
    return isValid;
  }
}
