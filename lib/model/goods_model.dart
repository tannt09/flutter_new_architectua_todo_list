class GoodsModel {
  final int? id;
  final String? productId;
  final String imageUrl;
  final bool isFavorite;
  final String name;
  final double price;
  final String star;
  final int numberOfReview;
  final String description;
  final List<SizeModel> sizeProduct;
  final String company;

  const GoodsModel(
      {this.id,
      this.productId,
      this.imageUrl = '',
      this.isFavorite = false,
      this.name = '',
      this.price = 0.00,
      this.star = "0.00",
      this.numberOfReview = 0,
      this.description = '',
      this.sizeProduct = const [],
      this.company = ''});

  factory GoodsModel.fromJson(Map<String, dynamic> json) {
    final List<SizeModel> sizeProduct = (json['size_product'] as List)
        .map((json) => SizeModel.fromJson(json))
        .toList();
    return GoodsModel(
      id: json['id'],
      productId: json['product_id'],
      imageUrl: json['image_url'],
      isFavorite: json['is_favorite'],
      name: json['name'],
      price: double.parse(json['price']),
      star: json['star'],
      numberOfReview: json['number_of_review'],
      description: json['description'],
      sizeProduct: sizeProduct,
      company: json['company'],
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
      'number_of_review': numberOfReview,
      'description': description,
      'size_product': sizeProduct,
      'company': company,
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
        star: "0.00",
        numberOfReview: 0,
        description: '',
        sizeProduct: [],
        company: '');
  }
}

class SizeModel {
  final int size;
  final int quantity;

  const SizeModel({
    required this.size,
    required this.quantity,
  });

  factory SizeModel.fromJson(Map<String, dynamic> json) {
    return SizeModel(
      size: json['size'],
      quantity: json['quantity'],
    );
  }
}
