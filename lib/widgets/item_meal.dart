import 'package:flutter/material.dart';
import 'package:flutterwave_demo_app/models/meal.dart';

class MealItem extends StatelessWidget {

  final Meal meal;
  final Function onMealClick;

  MealItem(this.meal, this.onMealClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
