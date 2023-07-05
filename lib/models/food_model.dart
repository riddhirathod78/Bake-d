class FoodModel {
  final int id;
  final String name;
  final String kg;
  final double price;
  final String rating;
  final String seller;
  final String location;
  final String time;
  final String desc;
  final String imageUrl;
  final String imageSquareUrl;

  const FoodModel({
    required this.id,
    required this.name,
    required this.kg,
    required this.price,
    required this.rating,
    required this.seller,
    required this.location,
    required this.time,
    required this.desc,
    required this.imageUrl,
    required this.imageSquareUrl,
  });
}
