import 'package:flutter_food_delivery_ui/models/food.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/models/user.dart';

// Food
final _burrito =
    Food(imageUrl: 'assets/images/burrito.jpg', name: 'بوریتو', price: 285339);
final _steak =
    Food(imageUrl: 'assets/images/steak.jpg', name: 'استیک', price: 1753399);
final _pasta =
    Food(imageUrl: 'assets/images/pasta.jpg', name: 'پاستا', price: 1453399);
final _ramen =
    Food(imageUrl: 'assets/images/ramen.jpg', name: 'رامن', price: 1353399);
final _pancakes =
    Food(imageUrl: 'assets/images/pancakes.jpg', name: 'پنکیک', price: 895339);
final _burger =
    Food(imageUrl: 'assets/images/burger.jpg', name: 'برگر', price: 1453399);
final _pizza =
    Food(imageUrl: 'assets/images/pizza.jpg', name: 'پیتزا', price: 1153399);
final _salmon = Food(
    imageUrl: 'assets/images/salmon.jpg', name: 'سالاد سالمون', price: 1253399);

// Restaurants
final _restaurant0 = Restaurant(
  imageUrl: 'assets/images/restaurant0.jpg',
  name: 'رستوران نمونه',
  address: 'تهران خیابان اکبری نرسیده به تقاطع اصغری نبش کوچه ی محمودی',
  rating: 5,
  menu: [_burrito, _steak, _pasta, _ramen, _pancakes, _burger, _pizza, _salmon],
);
final _restaurant1 = Restaurant(
  imageUrl: 'assets/images/restaurant1.jpg',
  name: 'ا‌ٰژدر زاپاتا',
  address: 'تهران خیابان اکبری نرسیده به تقاطع اصغری نبش کوچه ی محمودی',
  rating: 4,
  menu: [_steak, _pasta, _ramen, _pancakes, _burger, _pizza],
);
final _restaurant2 = Restaurant(
  imageUrl: 'assets/images/restaurant2.jpg',
  name: 'عطاویچ',
  address: 'تهران خیابان اکبری نرسیده به تقاطع اصغری نبش کوچه ی محمودی',
  rating: 4,
  menu: [_steak, _pasta, _pancakes, _burger, _pizza, _salmon],
);
final _restaurant3 = Restaurant(
  imageUrl: 'assets/images/restaurant3.jpg',
  name: 'اکبر جوجه',
  address: 'تهران خیابان اکبری نرسیده به تقاطع اصغری نبش کوچه ی محمودی',
  rating: 2,
  menu: [_burrito, _steak, _burger, _pizza, _salmon],
);
final _restaurant4 = Restaurant(
  imageUrl: 'assets/images/restaurant4.jpg',
  name: 'پدر خوب',
  address: 'تهران خیابان اکبری نرسیده به تقاطع اصغری نبش کوچه ی محمودی',
  rating: 3,
  menu: [_burrito, _ramen, _pancakes, _salmon],
);

final List<Restaurant> restaurants = [
  _restaurant0,
  _restaurant1,
  _restaurant2,
  _restaurant3,
  _restaurant4,
];

// User
final currentUser = User(
  name: 'Rebecca',
  orders: [
    Order(
      date: 'فرودین 10, 1399',
      food: _steak,
      restaurant: _restaurant2,
      quantity: 1,
    ),
    Order(
      date: 'فرودین 8, 1399',
      food: _ramen,
      restaurant: _restaurant0,
      quantity: 3,
    ),
    Order(
      date: 'فرودین 5, 1399',
      food: _burrito,
      restaurant: _restaurant1,
      quantity: 2,
    ),
    Order(
      date: 'فرودین 2, 1399',
      food: _salmon,
      restaurant: _restaurant3,
      quantity: 1,
    ),
    Order(
      date: 'فرودین 1, 1399',
      food: _pancakes,
      restaurant: _restaurant4,
      quantity: 1,
    ),
  ],
  cart: [
    Order(
      date: 'فرودین 11, 1399',
      food: _burger,
      restaurant: _restaurant2,
      quantity: 2,
    ),
    Order(
      date: 'فرودین 11, 1399',
      food: _pasta,
      restaurant: _restaurant2,
      quantity: 1,
    ),
    Order(
      date: 'فرودین 11, 1399',
      food: _salmon,
      restaurant: _restaurant3,
      quantity: 1,
    ),
    Order(
      date: 'فرودین 11, 1399',
      food: _pancakes,
      restaurant: _restaurant4,
      quantity: 3,
    ),
    Order(
      date: 'فرودین 11, 1399',
      food: _burrito,
      restaurant: _restaurant1,
      quantity: 2,
    ),
  ],
);
