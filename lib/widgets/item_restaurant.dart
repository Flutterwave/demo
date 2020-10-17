import 'package:flutter/material.dart';
import 'package:flutterwave_demo_app/models/restaurant.dart';

class RestaurantItem extends StatelessWidget {

  final Restaurant restaurant;
  final Function onRestaurantClicked;

  RestaurantItem(this.restaurant, this.onRestaurantClicked);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          Image.asset("restaurant.png", width: double.infinity, height: 100,)

        ],
      ),
    );
  }
}
