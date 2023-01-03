import 'package:flutter/material.dart';

class MHeaderCell extends StatelessWidget {
  final Widget child;
  final int flex;
  const MHeaderCell({Key? key, required this.child, required this.flex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:flex,
      child: Container(
          padding: const EdgeInsets.only(top: 7,bottom: 7),
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

