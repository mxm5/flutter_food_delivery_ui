import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    int total = 0;
    currentUser.orders.forEach((order) {
      total += order.quantity.toInt() * order.food.price.toInt();
    });
    return Scaffold(
      appBar: AppBar(
//        centerTitle: true,
        leading: Icon(Icons.account_box),
        title: Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            'پرداخت نهایی',
            style: TextStyle(
                fontFamily: 'hekayat',
                fontWeight: FontWeight.w900,
                letterSpacing: 3),
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text('بازگشت',
                    style: TextStyle(
                      fontFamily: 'Vazir',
                      fontSize: 12,
                    )),
              ),
            ),
          ),
          Icon(Icons.clear),
        ],
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int idx) {
            if (idx < currentUser.cart.length) {
              final Order order = currentUser.orders[idx];
              final Food food = order.food;
              return Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 110,
                                width: 110,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          food.imageUrl,
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      food.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      order.restaurant.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              food.price.toStringAsFixed(0),
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              'ریال',
                              style: TextStyle(fontSize: 10),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -1,
                    right: 20,
                    child: FoodQuantity(order: order),
                  ),
                ],
              );
            }
            return Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('زمان تقریبی'),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(Icons.timer),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        ' 1 ساعت و 25 دقیقه ',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('قیمت نهایی'),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(Icons.monetization_on),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        total.toString() + '  ریال ',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int idx) {
            return Divider(
              color: Colors.grey,
              height: 2,
            );
          },
          itemCount: currentUser.cart.length + 1),

// TODO: ONLY ADDING COLUMN TO THE LIST WORKS OTHER STUFF DON'T LIKE CONTAINER

      bottomSheet: Container(
        height: 100,
        color: Colors.green,
        child: Center(
          child: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'پرداخت نهایی',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
                Icon(Icons.account_balance,
                  color: Colors.white,
                )
              ],
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

class FoodQuantity extends StatefulWidget {
  const FoodQuantity({
    @required this.order,
  });

  final Order order;

  @override
  _FoodQuantityState createState() => _FoodQuantityState();
}

class _FoodQuantityState extends State<FoodQuantity> {
  int qtt = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 45,
      decoration: BoxDecoration(
          color: Colors.red[900].withOpacity(1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.white,
            ),
            onPressed: () {
              if (qtt + widget.order.quantity > 0) {
                setState(() {
                  qtt--;
                });
              }
            },
          ),
          Text(
            '${widget.order.quantity + qtt}',
            style: TextStyle(color: Colors.white),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                qtt++;
              });
            },
          ),
        ],
      ),
    );
  }
}
