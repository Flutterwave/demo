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
}
