import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/src/public_ext.dart';
import '../../shared/constanst/enum.dart';
import '../button/m_button.dart';
import '../button/m_button_action.dart';

class MButtonDelete extends StatelessWidget {
  final Function onConfirmDelete;
  const MButtonDelete({Key? key,required this.onConfirmDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MButtonAction(onPress: (){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: Container(

                constraints: BoxConstraints(minWidth: 550, maxWidth: 600,minHeight: 100,maxHeight: 800),
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),

                        color: Colors.white,
                      ),
                      child: Column(

                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 40),
                            child: Text('CONFIRM_DELETE'.tr(),style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18),),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: 30),
                            child: Text('CONFIRM_TO_DELETE_RECORD'.tr(),style: TextStyle(fontWeight: FontWeight.w100,fontSize: 14,),),
                          ),
                          MButton(onPress: (){
                            onConfirmDelete(context);
                          }, text: "DELETE", type: ButtonType.negative)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // actions: [
              //   RaisedButton(
              //       child: Text("Submit"),
              //       onPressed: () {
              //         // your code
              //       })
              // ],
            );
          });
    }, icon: FontAwesomeIcons.trash, color: Colors.grey,width: 30,height:30,fontSize:14);
  }
}
