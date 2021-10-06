import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Vazir'),
//        scaffoldBackgroundColor: Colors.grey[100],
        accentColor: Colors.red[900],
        toggleableActiveColor: Colors.red[900],
//        primaryColorDark: Colors.lime,
        primaryColor: Colors.red[900],
//        primaryColorLight: Colors.pink,
        focusColor: Colors.red,

      ),
      home: HomeScreen(),
    );
  }
}

