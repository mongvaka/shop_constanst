import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_constanst/page/categories/category_model.dart';
import 'package:shop_constanst/page/categories/category_services.dart';
import 'package:shop_constanst/page/menu/top/app_bar.dart';
import 'package:shop_constanst/page/register/register.dart';
import 'package:shop_constanst/shared/constanst/constanst.dart';
import 'package:shop_constanst/shared/constanst/enum.dart';
import 'package:shop_constanst/shared/functions/form_validate.dart';
import 'package:shop_constanst/shared/model/basic_search.dart';
import 'package:shop_constanst/widget/button/m_button.dart';
import 'package:shop_constanst/widget/datagrid/m_datagrid.dart';
import 'package:shop_constanst/widget/input/m_input.dart';

import '../../shared/model/basic_respons.dart';
import '../../shared/model/basic_validate.dart';
import '../../widget/datagrid/m_body_action.dart';
import '../../widget/datagrid/m_body_cell.dart';
import '../../widget/datagrid/m_button_delete.dart';
import '../../widget/datagrid/m_button_edit.dart';
import '../../widget/datagrid/m_button_view.dart';

import 'package:easy_localization/src/public_ext.dart';

import '../../widget/datagrid/m_header_cell.dart';
import '../menu/left/left_menu.dart';

class Category extends StatefulWidget {
   BasicSearchModel searchModel =  BasicSearchModel();
   CustomValidate customValidate = CustomValidate();
   Category({Key? key}) : super(key: key);
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    CategoryModel model = CategoryModel();
    CategoryService service = CategoryService();
    TextEditingController searchController = TextEditingController(text: '');
    return Scaffold(

      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBarMenu()
    ),
        drawer: const LeftMenu(),
        body: DataGrid(
          title: 'CATEGORY',
          onCreate: (){
            categoryItem(context,CategoryModel());
          },
          header: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MHeaderCell(onPress: (key){
                print('object');
              },
            columnKey: 'code'
            ,flex: 2,child: Text('CODE'),),
              MHeaderCell(onPress: (key){
                print('object');
              },
                columnKey: 'name',
                flex: 4,child: Text('NAME'),),
            ],
          ),
          searchModel: widget.searchModel,
          url: service.list(widget.searchModel),
            row:(dynamic result){
             return categoryList(context,result);
            },
          onsearch: (BasicSearchModel search){
            setState(() {
              widget.searchModel = search;
              print('searchhh');
            });
          },
        ));

  }

  categoryItem(BuildContext context,CategoryModel model) {
    CategoryService service = CategoryService();
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
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),),
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
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),

                      color:  Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: Text('ADD_CATEGORY'.tr(),style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
                        ),
                        MInput(prefixIcon: FontAwesomeIcons.barcode,key: Key('CODE_CATEGORY'),hintText: 'CODE_CATEGORY',mandatory: true,mandatoryText: 'PRESS_TYPE', controller: model.cCode,inputType: TextFieldType.text, onChange: (val,state){
                          widget.customValidate.add('CODE_CATEGORY',state);
          }),
                        MInput(prefixIcon: FontAwesomeIcons.cubes,key: Key('NAME_CATEGORY'), hintText: 'NAME_CATEGORY',controller: model.cName, onChange: (val,state){
                           widget.customValidate.add('NAME_CATEGORY',state);
                        }),
                        MButton(onPress: (){

                          if (widget.customValidate.isValid()) {
                            print('is pass ');
                            if(model.id==null){

                              print(model.cCode.text);
                              service.create(model).then((value) => {
                                print(CategoryModel.fromJson(value).name),
                                Navigator.pop(context),
                                setState(() {

                                })

                              });
                            }else {
                              // service.edit(model).then((value) =>
                              // {
                              //   print(CategoryModel
                              //       .fromJson(value)
                              //       .name),
                              //   Navigator.pop(context),
                              //   setState(() {
                              //
                              //   })
                              // });
                            }

                          } else {
                            print('is false ');
                          }

                        },
          text: "SAVE", type: ButtonType.positive)
                      ],
                    ),
                  )
                ],
              ),
            ),

          );
        });
  }

  categoryList(BuildContext context,dynamic result)  {
     CategoryModel model = CategoryModel.fromJson(result);
     return InkWell(
       child: Container(
         color: Colors.white,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             MBodyCell(flex: 2,child: Text(model.code??''),),
             MBodyCell(flex: 4,child: Text(model.name??''),),
             MBodyAction(
               onEdit: (){
                 categoryItem(context,CategoryModel.fromJson(result));
               },
               onDelete: (BuildContext context) async {
                 CategoryService service =   CategoryService();
                 dynamic result = await service.delete(model.id??'0');
                 if(result!=null){
                   Navigator.pop(context);
                 setState(() {

                 });
                 }
               },
             )
           ],
         ),

       ),
     );
  }
}
