import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Paginate extends StatefulWidget {
  final Function(String) onPaginate;
  String? currentPage;
  final String? totalPage;
  Color bgColor = Colors.blue.shade50;
  int? hoverIndex = null;
  bool nextHover = false;
  bool previousHover = false;
   Paginate({Key? key, required this.onPaginate, this.currentPage, this.totalPage}) : super(key: key){
     List<String> pageList = [];
   }
  @override
  State<Paginate> createState() => _PaginateState();
}
class _PaginateState extends State<Paginate> {
  // int total = int.parse(widget.totalPage);
  // int current = int.parse(currentPage);
  @override
  Widget build(BuildContext context) {
    final List<InkWell> listPaginate =[          InkWell(
      onTap: (){
        if(widget.currentPage!='1'){
          setState(() {
            widget.currentPage = '${(int.parse(widget.currentPage??'1') - 1)}';
            widget.onPaginate(widget.currentPage??'1');
          });
        }
      },
      onHover: (val){
        setState(() {
          widget.previousHover = val;
        });
      },
      child: Container(
        width: 25,
        height: 25,
        margin: EdgeInsets.only(left: 5,right: 5),
        padding: EdgeInsets.only(top: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
            style: BorderStyle.solid,
          ),
          color: widget.previousHover==true? widget.bgColor:Colors.grey.shade50,
        ),
        child: Row(
          children: [
            Spacer(),
            Icon(FontAwesomeIcons.angleLeft,size: 14,color: Colors.grey,),
            Spacer()
          ],
        ),

      ),
    ),];
    for( var i = 1 ; i <=int.parse(widget.totalPage??'1'); i++ ) {
      listPaginate.add( InkWell(
        onHover: (val){
          if(val){
            setState(() {
              widget.hoverIndex = i;
            });
          }else{
            setState(() {
              widget.hoverIndex = null;
            });
          }
        },
        onTap: (){
          setState(() {
            widget.currentPage = '$i';
            widget.onPaginate(widget.currentPage??'1');
          });
        },
        child: Container(
          width: 25,
          height: 25,
          margin: EdgeInsets.only(left: 5, right: 5),
          padding: EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: i==(int.parse(widget.currentPage??'1'))? Colors.blue.shade200: Colors.grey.shade200,
              width: 1,
              style: BorderStyle.solid,
            ),
            color: widget.hoverIndex==i? widget.bgColor:Colors.grey.shade50,
          ),
          child: Row(
            children: [
              Spacer(),
              Text('$i', style: TextStyle(
                  color: i==(int.parse(widget.currentPage??'1'))? Colors.blue:Colors.grey, fontWeight: FontWeight.w400, fontSize: 14),),
              Spacer()
            ],
          ),
        ),
      ));
    }
    listPaginate.add( InkWell(
      onTap: (){
        if(widget.currentPage!='${widget.totalPage}'){
          setState(() {
            widget.currentPage = '${(int.parse(widget.currentPage??'1') +1)}';
            widget.onPaginate(widget.currentPage??'1');
          });
        }
      },
      onHover: (val){
        setState(() {
          widget.nextHover = val;
        });
      },
      child: Container(
        width: 25,
        height: 25,
        margin: EdgeInsets.only(left: 5,right: 5),
        padding: EdgeInsets.only(top: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
            style: BorderStyle.solid,
          ),
          color: widget.nextHover==true? Colors.blue.shade50:Colors.grey.shade50,
        ),
        child: Row(
          children: [
            Spacer(),
            Icon(FontAwesomeIcons.angleRight,size: 14,color: Colors.grey,),
            Spacer()
          ],
        ),
      ),
    ));
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.grey.shade200),
        ),
      ),
      alignment: Alignment.center,
      child:Row(
        children: [
          Spacer(),
          ...listPaginate,
          Spacer()
        ],
      ),
    );
  }
}
