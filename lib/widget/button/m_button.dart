import 'package:flutter/material.dart';

import '../../shared/constanst/enum.dart';

class MButton extends StatelessWidget {
  final  Function onPress;
  final String text;
  final ButtonType type;

  const MButton({super.key, required this.onPress, required this.text, required this.type});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 40),
      height: 50,
      child: ElevatedButton(onPressed: (){
        onPress();
      },
        onHover:(value){
        },
        child: Text(text,style: TextStyle(color:type==ButtonType.positive? Colors.blue:Colors.red,fontWeight: FontWeight.w900,fontSize: 18),),

        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontWeight: FontWeight.w900),
            backgroundColor: type==ButtonType.positive? Colors.blue[50]:Colors.red[50],
          side: BorderSide(color: type==ButtonType.positive? Colors.blue:Colors.red,width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)))



        ),
      ),
    );
  }
}