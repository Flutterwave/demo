
import 'models/restaurant.dart';

class RestaurantUtils {
  static List<Restaurant> getDummyRestaurants() {
    final hoaSushi = Restaurant("Hoa Sushi", "Sushi, Salads", 10, true);
    final burgerMe = Restaurant("BurgerMe", "Burgers, American", 25, false);
    final telePizza =
        Restaurant("Tele Pizza", "Italian style pizza, Snacks", 10, false);
    final safranSalads =
        Restaurant("Safran Salads", "Sushi, Salads", 10, false);
    final ritaGrill = Restaurant("Rita Grill", "Arab, Burgers", 19, false);
    final manhattanSushi =
        Restaurant("Manhattan Sushi", "American, Sushi", 10, true);
    final pastaRhymes =
        Restaurant("Pasta Rhymes", "Pasta, Schnitzels", 12, false);

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
