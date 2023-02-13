import 'package:flutter/material.dart';

class MBodyCell extends StatelessWidget {
  final int flex;
  final Widget child;
   MBodyCell({Key? key, required this.flex,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(

      flex:flex,
      child: Container(
          padding: EdgeInsets.only(top: 10,bottom: 10),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: 1.0, color: Colors.grey.shade200),
              bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
            ),
          ),
          alignment: Alignment.center,
          child: child),
    );
  }
}