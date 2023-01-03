import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/src/public_ext.dart';
class BodyMenu extends StatelessWidget {
  final String text;
  final Function function;
  const BodyMenu({Key? key,required this.text,required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40),
      child: ListTile(
        title: Text(text.tr(),style: TextStyle(fontSize: 14,color: Colors.grey.shade600),),
        onTap: () {
          function();
        },
      ),
    );
  }
}
