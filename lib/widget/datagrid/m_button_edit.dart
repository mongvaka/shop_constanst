import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/src/public_ext.dart';

import '../button/m_button_action.dart';
class MButtonEdit extends StatelessWidget {
  final Function onPress;
  const MButtonEdit({Key? key,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MButtonAction(onPress: (){
      onPress();
    }, icon: FontAwesomeIcons.pen, color: Colors.blue,width: 30,height: 30,fontSize:14);
  }
}
