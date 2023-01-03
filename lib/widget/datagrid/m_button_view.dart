import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../button/m_button_action.dart';

class MButtonView extends StatelessWidget {
  final Function() onPress;
  const MButtonView({Key? key,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MButtonAction(onPress: (){
      onPress();
    }, icon: FontAwesomeIcons.eye, color: Colors.blue,width: 30,height: 30,fontSize:14);
  }
}
