class ItemsModel {
  final String productName;
  final int id;
  final double price;
  final int reviewers;
  final double rating;
  final String description;
  final String image;
  const ItemsModel({
    required this.productName,
    required this.price,
    required this.id,
    required this.reviewers,
    required this.rating,
    required this.image,
    required this.description,
  });
}
