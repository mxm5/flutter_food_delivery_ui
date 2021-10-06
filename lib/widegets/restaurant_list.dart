import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widegets/resturant_tile.dart';
import 'package:flutter_food_delivery_ui/widegets/titleTex.dart';

class RestaurantList extends StatelessWidget {
//  const RestaurantList({
//    Key key,
//  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        gradient: LinearGradient(
//          begin: Alignment.t,
          colors: [
            Colors.grey[300],
            Colors.grey[300],
            Colors.white,
            Colors.white,
            Colors.grey[300],
          ]
        )
      ),
//      color: Colors.red[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildRestaurant(),
      ),
    );
  }

  List<Widget> _buildRestaurant() {
    List<Widget> restaurantsList = [];

    restaurantsList.add(Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Icon(Icons.restaurant,size: 20,),
        ),
        SizedBox(width: 20,),
        buildPaddedTitleText(textString: 'رستوران های محبوب')

      ],
    ));

    restaurantsList.add(
      SizedBox(
        height: 15,
      ),
    );
    for (Restaurant restaurant in restaurants) {
      restaurantsList.add(RestaurantTile(restaurant: restaurant));
    }
    return restaurantsList;
  }
}


