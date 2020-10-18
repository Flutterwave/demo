import 'package:flutter/material.dart';
import 'package:flutterwave_demo_app/models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function onMealClick;
  final bool disableButton;

  MealItem(this.meal, this.onMealClick, this.disableButton);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                this.meal.name,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(width: double.infinity, height: 5),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 10, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                this.meal.description,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          SizedBox(width: double.infinity, height: 10),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 10, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.money_rounded),
                      Text(
                          "${this.meal.orderCurrency} ${this.meal.orderAmount}.00")
                    ],
                  ),
                  SizedBox(width: 10),
                  Row(
                    children: [
                      Icon(Icons.timer),
                      Text("${this.meal.minimumDeliveryTime} minutes"),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.fromLTRB(5, 10, 0, 5),
            child: RaisedButton(
              onPressed: this.disableButton ? null: this._onMealClick,
              child: Text(
                "ADD TO CART",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  void _onMealClick() {
    this.onMealClick(this.meal);
  }
}
