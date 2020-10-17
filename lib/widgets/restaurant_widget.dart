import 'package:flutter/material.dart';

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
      child: ListView.builder(itemCount: this.restaurants.length, itemBuilder: (context, index){
        return RestaurantItem(this.restaurants[index], this._onRestaurantClick);
      }),
    );
  }

  void _onRestaurantClick() {

  }
}
