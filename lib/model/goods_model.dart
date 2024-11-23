class GoodsModel {
  final int? id;
  final String? productId;
  final String imageUrl;
  final bool isFavorite;
  final String name;
  final double price;

  const GoodsModel({
    this.id,
    this.productId,
    this.imageUrl = '',
    this.isFavorite = false,
    this.name = '',
    this.price = 0.00,
  });

  factory GoodsModel.fromJson(Map<String, dynamic> json) {
    return GoodsModel(
      id: json['id'],
      productId: json['product_id'],
      imageUrl: json['image_url'],
      isFavorite: json['is_favorite'],
      name: json['name'],
      price: double.parse(json['price']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'image_url': imageUrl,
      'is_favorite': isFavorite,
      'name': name,
      'price': price.toString(),
    };
  }
}
