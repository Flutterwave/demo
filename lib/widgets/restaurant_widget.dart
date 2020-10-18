import 'package:flutter/material.dart';
import 'package:flutterwave_demo_app/models/restaurant.dart';
import 'package:flutterwave_demo_app/widgets/meals_widget.dart';

import '../utils.dart';
import 'item_restaurant.dart';

class Restaurants extends StatefulWidget {
  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {

  final restaurants = RestaurantUtils.getDummyRestaurants();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: this.restaurants.length,
        itemBuilder: (context, index) {
          return RestaurantItem(
              this.restaurants[index], this._onRestaurantClick);
        },
        separatorBuilder: (context, index) =>Container(
          margin: EdgeInsets.all(5),
          child: Divider(color: Colors.black),
        ),
      ),
    );
  }

  void _onRestaurantClick(final Restaurant restaurant) {
    Navigator.push(this.context,
        MaterialPageRoute(builder: (context) => MealsWidget(restaurant.meals)));
  }
}
