import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:shop_constanst/widget/datagrid/m_button_delete.dart';
import 'package:shop_constanst/widget/datagrid/m_button_edit.dart';
import 'package:shop_constanst/widget/datagrid/m_button_view.dart';
import '../../shared/constanst/enum.dart';
import '../button/m_button.dart';
import '../button/m_button_action.dart';
import '../input/m_input.dart';
import 'm_body_cell.dart';

class DataGrid extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  final  Function onCreate;
  final  Function onDelete;
  final Row header;
  final List<Container>  body ;
  DataGrid({Key? key,required this.onCreate,required this.onDelete,required this.header,required this.body}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Container(
        child: ListView(
          children: [
            Row(
              children: [
                SizedBox(width: 40,),
                Container(
                  padding: EdgeInsets.only(top: 40),
                  child: Text('CATEGORIES',
                    style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w700,),
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  width: 250,
                  child: MInput(
                    controller: searchController,
                    hintText: 'SEARCH',
                    height:40,
                    mandatory: true,
                    prefixIcon: FontAwesomeIcons.search,
                    key: const Key('PASSWORD'),
                    onChange: (){
                    } ,
                  ),
                ),
                Spacer(),
                Container(
                    width: 100,
                    child: MButton(
                      onPress: (){
                            onCreate();
                      },
                      text: 'CREATE',
                      type: ButtonType.positive,
                    )
                ),
                SizedBox(width: 40,)
              ],
            ),
            Container(

              margin: EdgeInsets.all(40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                color: Colors.grey.shade50,

              ),
              child: Container(
                height: 650,
                width:double.infinity,
                child: Column(

                  children: [
                    header,
                    ...body,
                    Spacer(),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1.0, color: Colors.grey.shade200),
                        ),
                      ),
                      alignment: Alignment.center,
                      child:Row(
                        children: [
                          Spacer(),
                          Container(
                            width: 25,
                            height: 25,
                            margin: EdgeInsets.only(left: 5,right: 5),
                            padding: EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                              color: Colors.grey.shade50,
                            ),
                            child: Row(
                              children: [
                                Spacer(),
                                Icon(FontAwesomeIcons.angleLeft,size: 14,color: Colors.grey,),
                                Spacer()
                              ],
                            ),

                          ),
                          Container(
                            width: 25,
                            height: 25,
                            margin: EdgeInsets.only(left: 5,right: 5),
                            padding: EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                              color: Colors.grey.shade50,
                            ),
                            child: Row(
                              children: [
                                Spacer(),
                                Text('1',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize:14),),
                                Spacer()
                              ],
                            ),

                          ),
                          Container(
                            width: 25,
                            height: 25,
                            margin: EdgeInsets.only(left: 5,right: 5),
                            padding: EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                              color: Colors.grey.shade50,
                            ),
                            child: Row(
                              children: [
                                Spacer(),
                                Text('2',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize:14),),
                                Spacer()
                              ],
                            ),

                          ),
                          Container(
                            width: 25,
                            height: 25,
                            margin: EdgeInsets.only(left: 5,right: 5),
                            padding: EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                              color: Colors.grey.shade50,
                            ),
                            child: Row(
                              children: [
                                Spacer(),
                                Text('3',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize:14),),
                                Spacer()
                              ],
                            ),

                          ),
                          Container(
                            width: 25,
                            height: 25,
                            margin: EdgeInsets.only(left: 5,right: 5),
                            padding: EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                              color: Colors.grey.shade50,
                            ),
                            child: Row(
                              children: [
                                Spacer(),
                                Icon(FontAwesomeIcons.angleRight,size: 14,color: Colors.grey,),
                                Spacer()
                              ],
                            ),

                          ),
                          Spacer()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
