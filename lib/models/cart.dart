
import 'meal.dart';

class Cart {
  List<Meal> meals;
  int total;

  int getTotal() {
    int total = 0;
    this.meals.map((meal) => {
      total = total + (meal.orderAmount * meal.quantity)
    });
    return total;
  }

  removeMealFromCart(final Meal meal) => this.meals.remove(meal);
  addMealToCart(final Meal meal) => this.meals.add(meal);
}