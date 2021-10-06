import 'package:flutter/material.dart';

class Rate extends StatelessWidget {
  final int rate;
  final double size;

  Rate({this.rate,this.size=15});

  List<Icon> createRate(int rate) {
    List<Icon> rateIcon = [
      Icon(
        Icons.star,
        color: Colors.grey[300],
        size: size,
      ),
      Icon(
        Icons.star,
        color: Colors.grey[300],
        size: size,
      ),
      Icon(
        Icons.star,
        color: Colors.grey[300],
        size: size,
      ),
      Icon(
        Icons.star,
        color: Colors.grey[300],
        size: size,
      ),
      Icon(
        Icons.star,
        color: Colors.grey[300],
        size: size,
      ),
    ];
    for (int i = 0; i < rate; i++) {
      rateIcon.removeAt(4 - i);
      rateIcon.insert(
          4 - i,
          Icon(
            Icons.star,
            color: Colors.yellow[700],
            size: size,
          ));
    }
    return rateIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: createRate(rate),
    );
  }
}
