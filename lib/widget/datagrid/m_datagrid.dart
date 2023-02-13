import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:shop_constanst/shared/model/basic_search.dart';
import 'package:shop_constanst/widget/datagrid/m_button_delete.dart';
import 'package:shop_constanst/widget/datagrid/m_button_edit.dart';
import 'package:shop_constanst/widget/datagrid/m_button_view.dart';
import 'package:shop_constanst/widget/datagrid/m_paginate.dart';
import '../../shared/constanst/enum.dart';
import '../button/m_button.dart';
import '../button/m_button_action.dart';
import '../input/m_input.dart';
import 'm_body_cell.dart';
import 'm_header_cell.dart';

class DataGrid extends StatefulWidget {
  final  Function onCreate;
  final Row header;
  final  Future<dynamic>  url ;
  final Function(dynamic) row;
  final Function(BasicSearchModel) onsearch;
  final String title;
  final BasicSearchModel searchModel;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DataGrid({Key? key,required this.onCreate,required this.header, required this.url, required this.row, required this.onsearch, required this.searchModel, required this.title}) : super(key: key){
    print('searModelInit${searchModel.page==''}');
  }

  @override
  State<DataGrid> createState() => _DataGridState();
}

class _DataGridState extends State<DataGrid> {
  TextEditingController searchController = TextEditingController();

  String? totalPage = '1';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
        child: ListView(

          children: [
            Row(
              children: [
                SizedBox(width: 40,),
                Container(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(widget.title,
                    style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w700,),
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  width: 250,
                  child: MInput(
                    controller: widget.searchModel.cText,
                    hintText: 'SEARCH',
                    height:40,
                    mandatory: true,
                    prefixIcon: FontAwesomeIcons.search,
                    key: const Key('PASSWORD'),
                    suffixIcon: FontAwesomeIcons.angleRight,
                    onChange: (value,formKey){
                      print('change');
                      widget.onsearch(widget.searchModel);
                    } ,
                  ),
                ),
                Spacer(),
                Container(
                    width: 100,
                    child: MButton(
                      onPress: (){
                            widget.onCreate();
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
              child: IntrinsicHeight(

                child:Column(

                  children: [
                    Row(children: [
                      ...widget.header.children,
                      Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.only(top: 7,bottom: 7),
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(width: 1.0, color: Colors.grey.shade200),
                                bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
                              ),

                            ),
                            alignment: Alignment.center,
                            child: Text('ACTION')),
                      )
                    ],),
                    FutureBuilder(
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snaphot){
                          if(snaphot.hasData) {
                            widget.searchModel.page = '${snaphot.data.currentPage }';
                            totalPage = '${snaphot.data.totalPage}';
                            dynamic result = snaphot.data.data.map((data){
                             return widget.row(data);
                            }
                            );
                            return Column( children: [...result],);
                          }
                          return CircularProgressIndicator();
                        },
                        future: widget.url),
                    Spacer(),
                    Paginate(onPaginate: (page){
                      widget.searchModel.page = page;
                      widget.searchModel.cPage.text = page;
                      widget.onsearch(widget.searchModel);

                    }, currentPage: widget.searchModel.page==''?'1':widget.searchModel.page, totalPage: totalPage)
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
