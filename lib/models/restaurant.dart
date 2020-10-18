import 'package:flutterwave_demo_app/models/meal.dart';
import 'package:flutterwave_demo_app/utils.dart';

class Restaurant {
  String name;
  String description;
  int deliveryTimeInMinutes;
  bool isFavourite;
  String image;
  List<Meal> meals = RestaurantUtils.getDummyMeals();

  Restaurant(
    this.name,
    this.description,
    this.deliveryTimeInMinutes,
    this.isFavourite,
    [this.image = "images/restaurant.jpg"]
  );
}
