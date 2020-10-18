class Meal {
  String name;
  String description;
  int quantity;
  int orderAmount;
  String orderCurrency;
  int minimumDeliveryTime;

  Meal(
      this.name, this.description, this.orderAmount, this.minimumDeliveryTime,
      this.orderCurrency, [this.quantity = 1]);
}
