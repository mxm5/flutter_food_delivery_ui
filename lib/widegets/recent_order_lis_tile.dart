import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';
import 'package:flutter_food_delivery_ui/widegets/add_to_cart_btn.dart';

class RecentOrderTile extends StatelessWidget {
  const RecentOrderTile({
    @required this.order,
  }) ;

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 325,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      height: 110,
                      width: 110,
                      fit: BoxFit.cover,
                      image: AssetImage(order.food.imageUrl),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${order.food.name} ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${order.restaurant.name}',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '${order.date}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Vazir',
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AddToMyCart(right: 10,),
//            Container(
//
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(30),
//                color: Colors.red[900],
//              ),
//              child: IconButton(
//                icon: Icon(Icons.add,color: Colors.white,),
//                onPressed: (){print('pressed');},
//              ),
//              margin: EdgeInsets.only(right: 20),
//            )
          ],
        ),
      ),
    );
  }
}