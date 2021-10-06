import 'package:flutter/material.dart';

class AddToMyCart extends StatelessWidget {
  final double bottom;
  final double top;
  final double right;
  final double left;

  AddToMyCart({this.top=0,this.left=0,this.right=0,this.bottom=0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48+left+right,height: 48+top+bottom,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
        color: Colors.red[900],
        boxShadow: [BoxShadow(
          color: Colors.red[50],
          offset: Offset(0,0),
          blurRadius:6 ,
        )],

      ),
      child: Padding(
        padding: EdgeInsets.only(top: top,left: left,right:right ,bottom:bottom ),
        child: Row(
          children: <Widget>[
            Icon(Icons.add,color: Colors.white,size: 19,),
            Icon(Icons.shopping_cart,color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
