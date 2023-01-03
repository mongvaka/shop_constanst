import 'package:flutter/material.dart';

import 'm_button_delete.dart';
import 'm_button_edit.dart';
import 'm_button_view.dart';

class MBodyAction extends StatelessWidget {
  final Function onEdit;
  final Function onDelete;
  const MBodyAction({Key? key, required this.onEdit, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:2,

      child: Container(
        padding:const EdgeInsets.only(top: 3,bottom: 3),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.grey.shade200),
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            MButtonEdit(onPress: (){
              onEdit();
            }),
            const Spacer(),
            MButtonDelete(onConfirmDelete: (){
              onDelete();
            }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
