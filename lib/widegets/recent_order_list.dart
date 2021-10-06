import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';
import 'package:flutter_food_delivery_ui/widegets/recent_order_lis_tile.dart';

class BuildResentOrderList extends StatelessWidget {

  final FixedExtentScrollController fixedExtentScrollController = FixedExtentScrollController();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
//      physics: NeverScrollableScrollPhysics(),
      reverse: true,
      itemBuilder: (BuildContext context, int idx) {
        final Order order = currentUser.orders[idx];
        return RecentOrderTile(order: order);
      },
      itemCount: currentUser.orders.length,

    );
  }
}