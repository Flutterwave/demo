import 'meal.dart';

class Cart {
  List<Meal> items = [];

  int getTotal() {
    if (this.items.isEmpty) return 0;
    var total = 0;
    for( var i = 0 ; i < items.length; i++ ) {
      final Meal meal = items[i];
      total = total + (meal.orderAmount * meal.quantity);
    }
    return total;
  }

  List<Meal> removeMealFromCart(final Meal meal) {
    if (this.items.contains(meal)) {
      this.items.remove(meal);
    }
    return this.items;
  }

  addMealToCart(final Meal meal) {
    if (this.items.contains(meal)) return;
    this.items.add(meal);
  }
}