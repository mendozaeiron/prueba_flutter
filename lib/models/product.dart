class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String image;
  final double ratingRate;
  final int ratingCount;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.image,
    required this.ratingRate,
    required this.ratingCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'].toDouble(),
      image: json['image'],
      ratingRate: json['rating']['rate'].toDouble(), // Captura el valor de "rate" de rating
      ratingCount: json['rating']['count'], // Captura el valor de "count" de rating
    );
  }
}
