import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/screens/cart_screen.dart';
import 'package:flutter_food_delivery_ui/widegets/build_recent_order.dart';
import 'package:flutter_food_delivery_ui/widegets/restaurant_list.dart';
import 'package:flutter_food_delivery_ui/widegets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  Widget buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(14.0),
      child: SearchBar(
        onClean: () {}, onChange: (v) {},
//        onChange: (val){
//        setState(() {
//          searchval =val;
//        },);
//      },onClean: (){
//        setState(() {
//          searchval ='';
//        });
//      },
      ),
    );
  }

// String searchval;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        centerTitle: true,
        leading: Icon(Icons.account_box),
        title: Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            'تحویل غذا ',
            style: TextStyle(
                fontFamily: 'hekayat',
                fontWeight: FontWeight.w900,
                letterSpacing: 3),
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CartScreen();
              }));
            },
            child: Container(
              child: Row(
                children: <Widget>[
                  Icon(Icons.fastfood),
                  Text(' (${currentUser.cart.length}) ' + 'سبد خرید  ',
                      style: TextStyle(
                        fontFamily: 'Vazir',
                        fontSize: 12,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          buildSearchBar(),
          RecentOrders(),
          RestaurantList(),
        ],
      ),
    );
  }
}
