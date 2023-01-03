import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/src/public_ext.dart';
class HeadMenu extends StatelessWidget {
  final String text;
  final IconData icon;
  const HeadMenu({Key? key,required this.text,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: Row(
        children: [
          const SizedBox(width: 20,),
          Icon(icon,color: Colors.grey,size: 16,),
          const SizedBox(width: 20,),
          Text(text.tr(),style:TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w900),),
          const Spacer(),
          const Icon(FontAwesomeIcons.angleDown,color: Colors.grey,size: 16,),
          const SizedBox(width: 20,),
        ],
      ),
    );
  }
}
