
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/src/public_ext.dart';

import '../../shared/constanst/constanst.dart';
import '../../shared/functions/validators.dart';

 class MInput extends StatefulWidget {
  final TextEditingController controller;
   String? hintText;
   String? helpText;
   IconData? prefixIcon;
   IconData? suffixIcon;
   int? inputType;
   bool? enabled;
   bool? readOnly;
   Color? borderColor;
   bool? mandatory;
   String? mandatoryText;
   Function onChange;
   double? height = 40;
  bool _isobscure = true;

  MInput({
    required Key key,
    required this.controller,
    this.hintText,
     this.helpText,
     this.prefixIcon,
     this.suffixIcon,
     this.inputType,
     this.enabled,
     this.readOnly,
     this.borderColor,
     this.mandatory,
     this.mandatoryText,
    required this.onChange,
    this.height = 40
  }) : super(key: key);

  @override
  _InputState createState() => _InputState(

  );
}

class _InputState extends State<MInput> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      height: widget.height,
      width: double.maxFinite,
      child: TextFormField(
        onChanged: (String text) {
            widget.onChange(text);
        },
        controller: widget.controller,
        obscureText: widget.inputType == TextFieldType.password
            ? widget._isobscure
            : false,
        readOnly: widget.readOnly??false,
        keyboardType: widget.inputType == TextFieldType.text
            ? TextInputType.multiline
            : widget.inputType == TextFieldType.password
            ? TextInputType.text
            : widget.inputType == TextFieldType.email
            ? TextInputType.emailAddress
            : widget.inputType == TextFieldType.number8
            ? TextInputType.number
            : widget.inputType == TextFieldType.number82
            ? const TextInputType.numberWithOptions(decimal: true)
            : widget.inputType == TextFieldType.phone
            ? TextInputType.phone
            : null,
        textInputAction: widget.inputType == TextFieldType.number8
            ? TextInputAction.done
            : widget.inputType == TextFieldType.number82
            ? TextInputAction.done
            : widget.inputType == TextFieldType.phone
            ? TextInputAction.done
            : TextInputAction.done,
        maxLength: widget.inputType == TextFieldType.text ? 500 : null,
        inputFormatters: widget.inputType == TextFieldType.number82
            ? [
          ThousandsFormatter(allowFraction: true),
          FilteringTextInputFormatter.allow(RegExp(r'^[0-9,.]+')),
          LengthLimitingTextInputFormatter(11)
        ]
            : widget.inputType == TextFieldType.number8
            ? [
          ThousandsFormatter(),
          FilteringTextInputFormatter.allow(RegExp(r'^[0-9,]+')),
          LengthLimitingTextInputFormatter(8)
        ]
            : widget.inputType == TextFieldType.phone
            ? [
          FilteringTextInputFormatter.allow(RegExp(r'^[0-9+]+')),
          LengthLimitingTextInputFormatter(10)
        ]
            : null,
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.grey),
            focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(
                  color: Colors.blue, width: 1,
                  style: BorderStyle.solid,
              ),
            ),
          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.grey, width: 1,
              ),

          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
                  color:widget.borderColor??Colors.black26,

                  width: 1,
              ),
          ),
          labelText: widget.hintText?.tr(),
          helperText: widget.helpText?.tr(),

          prefixIcon: Icon(widget.prefixIcon),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 65,

            ),
          suffixIcon: IconButton(
            icon: Icon(widget.suffixIcon),
            onPressed: () {
              setState(() {
                widget._isobscure = !widget._isobscure;
              });
            },
          )
        ),
        validator: (String? value) {
          if ((widget.mandatory??false) && (value == null || value.isEmpty)) {
            return widget.mandatoryText?.tr();
          }
          if (widget.inputType == TextFieldType.text && (value!.length > 500)) {
            return 'Please enter a message no more than 500 characters.';
          }
          if (widget.inputType == TextFieldType.password &&
              (value!.length < 8)) {
            return 'Please enter a password greater than 8 characters.';
          }
          if (widget.inputType == TextFieldType.email &&
              value!.contains(RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
            return 'Please fill in your email in the form : example@domaim.com';
          }
          return null;
        },
        style: (const TextStyle(fontSize: 16,color: Colors.grey)
        ),


      ),
    );
  }
}