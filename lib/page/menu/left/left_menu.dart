import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:shop_constanst/page/menu/left/widgets/body_menu.dart';
import 'package:shop_constanst/page/menu/left/widgets/head_menu.dart';
class LeftMenu extends StatelessWidget {
  const LeftMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 45,
            child: Row(
              children: [
               const SizedBox(width: 10,),
               IconButton(icon: Icon(Icons.menu,color: Colors.black,size: 23,),onPressed: (){

               },)
              ],
            ),
          ),
          SizedBox(width: 20,),
         const HeadMenu(text: 'ORDER', icon: FontAwesomeIcons.file),
          BodyMenu(text: 'ORDER', function:(){
            
          }),
          const HeadMenu(text: 'PRODUCT', icon: FontAwesomeIcons.box),
          BodyMenu(text: 'PRODUCT', function:(){

          }),
          BodyMenu(text: 'CATEGORIES', function:(){

          }),
          const HeadMenu(text: 'DELIVERY', icon: FontAwesomeIcons.moneyCheck),
          BodyMenu(text: 'DELIVERY_FEE', function:(){

          }),
          const HeadMenu(text: 'PAYMENT', icon: FontAwesomeIcons.moneyCheck),

          BodyMenu(text: 'PAYMENT_METHOD', function:(){

          }),
          BodyMenu(text: 'DELIVERY_FEE', function:(){

          }),
          const HeadMenu(text: 'SETTING', icon: FontAwesomeIcons.moneyCheck),
          BodyMenu(text: 'GENERAL_SETTING', function:(){

          }),
          BodyMenu(text: 'SHOP_INFO_SETTING', function:(){

          }),
        ],
      ),
    );
  }
}
