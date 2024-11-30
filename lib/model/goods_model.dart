class GoodsModel {
  final int? id;
  final String? productId;
  final String imageUrl;
  final bool isFavorite;
  final String name;
  final double price;
  final String star;

  const GoodsModel({
    this.id,
    this.productId,
    this.imageUrl = '',
    this.isFavorite = false,
    this.name = '',
    this.price = 0.00,
    this.star = "0.00",
  });

  factory GoodsModel.fromJson(Map<String, dynamic> json) {
    return GoodsModel(
      id: json['id'],
      productId: json['product_id'],
      imageUrl: json['image_url'],
      isFavorite: json['is_favorite'],
      name: json['name'],
      price: double.parse(json['price']),
      star: json['star'],
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
      'star': star,
    };
  }

  static GoodsModel initState() {
    return const GoodsModel(
        id: null,
        productId: null,
        imageUrl: '',
        isFavorite: false,
        name: '',
        price: 0.00,
        star: "0.00");
  }
}
