class Product {
  final String? id;
  final String? title;
  final String? description;
  final int? discountPercentage;
  final int? originalPrice;
  final int? discountedPrice;

  const Product({
    this.id,
    this.title,
    this.description,
    this.discountPercentage,
    this.originalPrice,
    this.discountedPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      discountPercentage: json['discount_percentage'],
      originalPrice: json['original_price'],
      discountedPrice: json['discounted_price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'discount_percentage': discountPercentage,
      'original_price': originalPrice,
      'discounted_price': discountedPrice,
    };
  }
}
