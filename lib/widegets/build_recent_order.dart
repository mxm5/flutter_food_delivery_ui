import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/widegets/recent_order_list.dart';
import 'package:flutter_food_delivery_ui/widegets/titleTex.dart';

class RecentOrders extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top:8.0),
              child: Icon(Icons.watch_later,size: 20,),
            ),
            SizedBox(width: 20,),
            buildPaddedTitleText(),

          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.black,
                Colors.red[900],
                Colors.red,
                Colors.red[200],
                Colors.red[900]
              ])),
          height: 120,
          child: BuildResentOrderList(),
        )
      ],
    );
  }

}