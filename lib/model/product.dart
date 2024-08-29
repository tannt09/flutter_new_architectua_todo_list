class Product {
  final String id;
  final String title;
  final String description;
  final int discount_percentage;
  final int original_price;
  final int discounted_price;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.discount_percentage,
    required this.original_price,
    required this.discounted_price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      discount_percentage: json['discount_percentage'],
      original_price: json['original_price'],
      discounted_price: json['discounted_price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'discount_percentage': discount_percentage,
      'original_price': original_price,
      'discounted_price': discounted_price,
    };
  }
}
