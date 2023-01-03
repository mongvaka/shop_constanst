import 'package:flutter/material.dart';

class MButtonLogo extends StatelessWidget {
  final  Function onPress;
  final IconData icon;
  final Color color;
  const MButtonLogo({super.key, required this.onPress, required this.icon,required this.color});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(left: 8,right: 8),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200, width: 1),
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: IconButton(onPressed: (){
        onPress();
      },
        icon: Icon(icon,size: 30,color: color,),
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.grey.shade100,width: 1),
          fixedSize: Size(50, 50),
        ),
      ),
    );
  }
}