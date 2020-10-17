class Restaurant {
  String name;
  String description;
  int deliveryTimeInMinutes;
  bool isFavourite;
  String image;

  Restaurant(
    this.name,
    this.description,
    this.deliveryTimeInMinutes,
    this.isFavourite,
    [this.image = "images/restaurant.jpg"]
  );
}
