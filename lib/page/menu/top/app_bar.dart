import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class AppBarMenu extends StatelessWidget {
  const AppBarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[50],
      elevation: 0,
      shape: Border(
          bottom: BorderSide(
              color: Colors.grey.shade200,
              width: 1
          )
      ),
      iconTheme: IconThemeData(
          color: Colors.grey[700]
      ),
      centerTitle: true,
      title: Text('Hello App bar') ,
      actions: [
        PopupMenuButton<int>(
          icon: Icon(FontAwesomeIcons.globeAsia,color: Colors.grey,size: 18,),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Container(
                height: 75,
                padding: EdgeInsets.only(top:5,bottom: 5),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network('https://picsum.photos/250?image=9',height: 45,width: 45,)),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                            width:300,
                            height: 50,
                            child: Text("Get The AppGet The AppGet The AppGet The AppGet The AppGet The App",style: TextStyle(color: Colors.grey,fontSize: 12),overflow: TextOverflow.clip)),
                        Spacer(),
                        Container(
                            width:300,
                            height: 15,
                            child: Row(
                              children: [
                                Text("ประมาณ 10 ชั่วโมงที่แล้ว",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700,fontSize: 12),),
                                Spacer(),
                                Text("ยังไม่อ่านแล้ว",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700,fontSize: 12),),
                              ],
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
          offset: Offset(0,40),
          color: Colors.grey.shade50,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30),),
          ),

          constraints: BoxConstraints(
              minWidth: 400,
            maxHeight: 950,
            maxWidth:  400
          ),
          elevation: 5,
          // on selected we show the dialog box
          // onSelected: (value) {
          //   // if value 1 show dialog
          //   if (value == 1) {
          //     _showDialog(context);
          //     // if value 2 show dialog
          //   } else if (value == 2) {
          //     _showDialog(context);
          //   }
          // },
        ),
        SizedBox(width: 15,),
        PopupMenuButton<int>(
          icon: Icon(FontAwesomeIcons.user,color: Colors.grey,size: 18,),
          itemBuilder: (context) => [
            // PopupMenuItem 1
            PopupMenuItem(
              value: 1,
              // row with 2 children
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(FontAwesomeIcons.userCog,color: Colors.grey,size: 20,),
                  SizedBox(
                    width: 20,
                  ),
                  Text("USER_INFO"),
                  Spacer(),
                  Icon(FontAwesomeIcons.angleRight,color: Colors.grey,size: 18,),
                ],
              ),
            ),
            // PopupMenuItem 2
            PopupMenuItem(
              value: 2,
              // row with two children
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(FontAwesomeIcons.signOutAlt,color: Colors.grey,size: 20,),
                  SizedBox(
                    width: 20,
                  ),
                  Text("SIGN_OUT"),
                  Spacer(),
                  Icon(FontAwesomeIcons.angleRight,color: Colors.grey,size: 18,),
                ],
              ),
            ),
          ],
          offset: Offset(0,40),
          color: Colors.grey.shade50,
          shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30),),
                  ),

          constraints: BoxConstraints(
            minWidth: 300
          ),
          elevation: 5,
          // on selected we show the dialog box
          // onSelected: (value) {
          //   // if value 1 show dialog
          //   if (value == 1) {
          //     _showDialog(context);
          //     // if value 2 show dialog
          //   } else if (value == 2) {
          //     _showDialog(context);
          //   }
          // },
        ),
        SizedBox(width: 15,)
      ],


    );
  }
}
