import 'meal.dart';

class Cart {
  List<Meal> items = [];
  int total = 0;

  int getTotal() {
    if (this.items.isEmpty) return 0;
    for( var i = 0 ; i < items.length; i++ ) {
      final Meal meal = items[i];
      print(items[i]);
      this.total = this.total + (meal.orderAmount * meal.quantity);
    }
    return this.total;
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