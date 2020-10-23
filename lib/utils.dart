import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutterwave_demo_app/main.dart';

import 'models/meal.dart';
import 'models/restaurant.dart';

class RestaurantUtils {
  static List<Restaurant> getDummyRestaurants() {
    final hoaSushi = Restaurant(
        "Hoa Sushi",
        "Sushi, Salads, Lorem ipsum dolor sit amet, consectetur adipiscing eli",
        10,
        true);
    final burgerMe = Restaurant(
        "BurgerMe",
        "Burgers, American, Lorem ipsum dolor sit amet, consectetur adipiscing eli",
        25,
        false,
        "images/restaurant_three.jpg");
    final telePizza = Restaurant(
        "Tele Pizza",
        "Italian style pizza, Snacks, Lorem ipsum dolor sit amet, consectetur adipiscing eli",
        10,
        false,
        "images/restaurant_two.jpg");
    final safranSalads = Restaurant(
        "Safran Salads",
        "Sushi, Salads, Lorem ipsum dolor sit amet, consectetur adipiscing eli",
        10,
        false,
        "images/restaurant_three.jpg");
    final ritaGrill = Restaurant(
        "Rita Grill",
        "Arab, Burgers, Lorem ipsum dolor sit amet, consectetur adipiscing eli",
        19,
        false,
        "images/restaurant_two.jpg");
    final manhattanSushi = Restaurant(
        "Manhattan Sushi",
        "American, Sushi, Lorem ipsum dolor sit amet, consectetur adipiscing eli",
        10,
        true);
    final pastaRhymes = Restaurant(
        "Pasta Rhymes",
        "Pasta, Schnitzels, Lorem ipsum dolor sit amet, consectetur adipiscing eli",
        12,
        false);

    return [
      hoaSushi,
      burgerMe,
      telePizza,
      safranSalads,
      ritaGrill,
      manhattanSushi,
      pastaRhymes
    ];
  }

  static List<Meal> getDummyMeals() {
    final sushi = Meal(
        "Super Sushi",
        " Et harum quidem rerum facilis est et expedita distinctio.",
        20,
        35,
        FlutterwaveCurrency.NGN);

    final sourSpicy = Meal(
        "Sour, Spicy Soup",
        " Et harum quidem rerum facilis est et expedita distinctio.",
        12,
        40,
        FlutterwaveCurrency.NGN);

    final seaweedSalad = Meal(
        "Seaweed Salad",
        " Et harum quidem rerum facilis est et expedita distinctio.",
        7,
        20,
        FlutterwaveCurrency.NGN);

    final salmonCurry = Meal(
        "Salmon Curry",
        " Et harum quidem rerum facilis est et expedita distinctio.",
        20,
        40,
        FlutterwaveCurrency.NGN);

    final avocadoMaki = Meal(
        "Avocado Maki",
        " Et harum quidem rerum facilis est et expedita distinctio.",
        11,
        30,
        FlutterwaveCurrency.NGN);

    final mangoSweet = Meal(
        "Mango-Sweet-Sauce Sauce",
        " Et harum quidem rerum facilis est et expedita distinctio.",
        8,
        40,
        FlutterwaveCurrency.NGN);

    final crunchy = Meal(
        "Crunchy Philadelphia Roll",
        " Et harum quidem rerum facilis est et expedita distinctio.",
        10,
        15,
        FlutterwaveCurrency.NGN);

    final chicken = Meal(
        "Whole Chicken(Spicy)",
        " Et harum quidem rerum facilis est et expedita distinctio.",
        25,
        50,
        FlutterwaveCurrency.NGN);

    return [
      sushi,
      sourSpicy,
      seaweedSalad,
      chicken,
      crunchy,
      salmonCurry,
      avocadoMaki,
      mangoSweet
    ];
  }

  static openNewScreenAndPopPreviousScreens(final BuildContext context, final Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => widget),
          (route) => false,
    );
  }

  static openHomePage(final BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => MyHomePage(title: "Restaurants",)),
          (route) => false,
    );
  }
}
