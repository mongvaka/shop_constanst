import 'package:flutter/material.dart';

class MButtonAction extends StatelessWidget {
  final  Function onPress;
  final IconData icon;
  final Color color;
  final double height;
  final double width;
  final double fontSize;
  const MButtonAction({super.key, required this.onPress, required this.icon,required this.color,this.height = 40,this.width = 40,this.fontSize= 20});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      height: height,
      child: IconButton(onPressed: (){
        onPress();
      },
        icon: Icon(icon,size: fontSize,color: color,),
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.grey.shade100,width: 1),
          fixedSize: Size(width, height),
        ),
      ),
    );
  }
}