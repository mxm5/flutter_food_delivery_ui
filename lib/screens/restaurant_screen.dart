import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widegets/add_to_cart_btn.dart';
import 'package:flutter_food_delivery_ui/widegets/rate_star.dart';
import 'package:flutter_food_delivery_ui/widegets/titleTex.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantScreen({this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  bool liked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          buildTopHeader(context),
          buildParagraph(),
          Expanded(
            child: GridView.count(crossAxisCount: 2,
              children:
                List.generate(widget.restaurant.menu.length, (idx){

                  final Food food = widget.restaurant.menu[idx] ;

                  return Center(
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(

                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(food.imageUrl),fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: 150,
                            height: 150,
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.65),
                                  Colors.black.withOpacity(0.35),
                                  Colors.black.withOpacity(0)
                                ]
                              )
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 20,),
                              Text(food.name,style: TextStyle(color: Colors.white,fontFamily: 'hekayat',fontSize: 20,fontWeight: FontWeight.bold),),
                              Text(food.price.toStringAsFixed(0)+'ریال',style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                        Positioned(bottom: 30,right: 10,
                        child:AddToMyCart() ,width: 48,height: 48,)
                      ],
                    ),
                  ) ;

                })
              ,
            ),
          )
        ],
      ),
    );
  }

  Padding buildParagraph() {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'فاصله تا شما 593 متر',
                    textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 11)
                  ),
                  SizedBox(width: 20,),
                  Icon(Icons.location_on )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(widget.restaurant.address,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontSize: 11))),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.location_city,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Rate(
                    rate: widget.restaurant.rating,
                    size: 20,
                  ),
                  Text(
                    'امتیاز  (${widget.restaurant.rating}) ',
                    style: TextStyle(fontSize: 11),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.mood)
                ],
              ),
              SizedBox(height: 10,),
              ButtonRow(),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.fastfood),
                  SizedBox(width: 15,),
                  buildPaddedTitleText(textString: ' فهرست غذاها '),

                ],
              )
            ],
          ),
        );
  }

  Stack buildTopHeader(BuildContext context) {
    return Stack(
      children: <Widget>[
        TopImage(imageUrl: widget.restaurant.imageUrl),
        buildRestaurantTopAppBar(context, widget.restaurant.name),
      ],
    );
  }

  Container buildRestaurantTopAppBar(BuildContext context, String title) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0)
          ],
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 12.0, left: 12, right: 12.0, bottom: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            buildPaddedTitleText(
                textString: '$title    ',
                color: Colors.white,
                letterSpacing: 10),
            Padding(
              padding: EdgeInsets.only(right: 8.0, bottom: 0),
              child: IconButton(
                  icon: Icon(
                    liked ? Icons.favorite : Icons.favorite_border,
                    color: liked ? Colors.red[400] : Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      liked = !liked;
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FlatButton(child: Text('نظرات',style: TextStyle(color: Colors.white,fontSize: 10),),color: Colors.red[900],onPressed: (){},shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17))),
        FlatButton(child: Text('دنبال کردن',style: TextStyle(color: Colors.white,fontSize: 10),),color: Colors.red[900],onPressed: (){},shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),),
      ],

    );
  }
}

class TopImage extends StatelessWidget {
  const TopImage({
    @required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: Image(
        image: AssetImage(imageUrl),
        height: 220,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }
}

