import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_constanst/page/categories/category_model.dart';
import 'package:shop_constanst/page/categories/category_services.dart';
import 'package:shop_constanst/page/menu/top/app_bar.dart';
import 'package:shop_constanst/page/register/register.dart';
import 'package:shop_constanst/shared/constanst/enum.dart';
import 'package:shop_constanst/widget/button/m_button.dart';
import 'package:shop_constanst/widget/datagrid/m_datagrid.dart';
import 'package:shop_constanst/widget/input/m_input.dart';

import '../../widget/datagrid/m_body_action.dart';
import '../../widget/datagrid/m_body_cell.dart';
import '../../widget/datagrid/m_button_delete.dart';
import '../../widget/datagrid/m_button_edit.dart';
import '../../widget/datagrid/m_button_view.dart';

import 'package:easy_localization/src/public_ext.dart';

import '../../widget/datagrid/m_header_cell.dart';
import '../menu/left/left_menu.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    CategoryModel model = CategoryModel();
    CategoryService service = CategoryService();
    TextEditingController searchController = TextEditingController(text: '');
    return Scaffold(

      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(45.0),
        child: AppBarMenu()
    ),
        drawer: const LeftMenu(),
        body: DataGrid(
          onCreate: (){
            categoryItem(context);
          },
          onDelete: (){},

          header: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MHeaderCell(flex: 2,child: Text('CODE'),),
              MHeaderCell(flex: 4,child: Text('DESCRIPTON'),),
              MHeaderCell(flex: 2,child: Text('STATUS'),),
              MHeaderCell(flex: 2,child: Text('ACTION'),)
            ],
          ),
          body: categoryList(context),
        ));

  }
  categoryItem(BuildContext context){
      CategoryModel model = CategoryModel();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: Container(
              constraints: BoxConstraints(minWidth: 150, maxWidth: 500,minHeight: 100,maxHeight: 800),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  Container(
                    padding:EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                      color: Colors.grey.shade300,
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.red,
                          ),
                          child: Icon(FontAwesomeIcons.timesCircle,size: 20,color: Colors.white,),
                          margin: EdgeInsets.only(top:15,left: 15),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                  Container(
                    padding:EdgeInsets.only(left: 50,right: 50,bottom: 50),
                    decoration: const BoxDecoration(
                      color:  Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: Text('ADD_CATEGORY'.tr(),style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
                        ),
                        MInput(prefixIcon: FontAwesomeIcons.barcode,key: Key('CODE_CATEGORY'),hintText: 'CODE_CATEGORY', controller: model.cCode, onChange: (){}),
                        MInput(prefixIcon: FontAwesomeIcons.cubes,key: Key('NAME_CATEGORY'), hintText: 'NAME_CATEGORY',controller: model.cDescription, onChange: (){}),
                        MButton(onPress: (){}, text: "SAVE", type: ButtonType.positive)
                      ],
                    ),
                  )
                ],
              ),
            ),

          );
        });
  }
   categoryList(BuildContext context) {
    List<Container> list = [
    Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const MBodyCell(flex: 2,child: Text('CODE'),),
          const MBodyCell(flex: 4,child: Text('DESCRIPTION'),),
          const MBodyCell(flex: 2,child: Text('STATUS'),),
          MBodyAction(
            onEdit: (){
              categoryItem(context);
            },
            onDelete: (){

            },
          )
        ],
      ),
    )
    ];
    return list;
  }
}
