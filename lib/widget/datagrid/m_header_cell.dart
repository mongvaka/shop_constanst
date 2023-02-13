import 'package:flutter/material.dart';

class MHeaderCell extends StatefulWidget {
  final Widget child;
  final int flex;
  final Function(String) onPress;
  final String columnKey;

   MHeaderCell({Key? key, required this.child, required this.flex, required this.onPress, required this.columnKey}) : super(key: key);

  @override
  State<MHeaderCell> createState() => _MHeaderCellState();
}

class _MHeaderCellState extends State<MHeaderCell> {
  bool? isHover;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:widget.flex,
      child: InkWell(
        // onTap: (){
        //   widget.onPress(widget.columnKey);
        // },
        // onHover: (value){
        //   setState(() {
        //     isHover = value;
        //   });
        //
        // },
        child: Container(
            padding: const EdgeInsets.only(top: 7,bottom: 7),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 1.0, color: Colors.grey.shade200),
                bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
              ),

            ),
            alignment: Alignment.center,
            child: widget.child),
      ),
    );
  }
}

