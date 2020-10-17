class Meal {
  String name;
  String description;
  int quantity;
  int orderAmount;
  int minimumDeliveryAmount;

  Meal(
      this.name, this.description, this.orderAmount, this.minimumDeliveryAmount,
      [this.quantity = 1]);
}
