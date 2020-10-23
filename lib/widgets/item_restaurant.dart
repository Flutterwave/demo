import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutterwave_demo_app/models/restaurant.dart';

class RestaurantItem extends StatefulWidget {
  final Restaurant restaurant;
  final Function(Restaurant) onRestaurantClicked;

  RestaurantItem(this.restaurant, this.onRestaurantClicked);

  @override
  _RestaurantItemState createState() => _RestaurantItemState();
}

class _RestaurantItemState extends State<RestaurantItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: GestureDetector (
        onTap: this.handleRestaurantSelection,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                this.widget.restaurant.image,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      this.widget.restaurant.name,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      this.setState(() {
                        this.widget.restaurant.isFavourite =
                        !this.widget.restaurant.isFavourite;
                      })
                    },
                    child: Icon(
                      this.widget.restaurant.isFavourite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      size: 30,
                      color: HexColor("F5A623"),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  this.widget.restaurant.description,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleRestaurantSelection(){
    this.widget.onRestaurantClicked(this.widget.restaurant);
  }
}
