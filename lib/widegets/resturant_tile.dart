import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/screens/restaurant_screen.dart';
import 'package:flutter_food_delivery_ui/widegets/rate_star.dart';

class RestaurantTile extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantTile({this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantScreen(restaurant: restaurant),
            ),
          );
        },
        child: Container(
          height: 120,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey, offset: Offset(2.0, 2), blurRadius: 02)
          ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: <Widget>[
              BuildImage(restaurant: restaurant),
              BuildTextTile(restaurant: restaurant),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildImage extends StatelessWidget {
  const BuildImage({
    @required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Hero(
        tag: restaurant.imageUrl,
        child: Image(
          image: AssetImage(restaurant.imageUrl),
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
      borderRadius: BorderRadius.circular(15),
    );
  }
}

class BuildTextTile extends StatelessWidget {
  const BuildTextTile({
    @required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 200,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.red[900],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(10))),
              child: Center(
                child: Text(
                  ' ${restaurant.name}  ',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'hekayat',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Rate(rate: restaurant.rating),
            SizedBox(
              height: 5,
            ),
            Text(
              '${restaurant.address} ',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 11),
            )
          ],
        ),
      ),
    );
  }
}
