import 'package:flutter_new_architectua/model/goods_model.dart';

class ItemCartModel {
  final int? id;
  final String? productId;
  final int quantity;
  final String imageUrl;
  final String name;
  final double price;
  final String company;

  const ItemCartModel(
      {this.id,
      this.productId,
      this.quantity = 0,
      this.imageUrl = '',
      this.name = '',
      this.price = 0.00,
      this.company = ''});

  factory ItemCartModel.fromJson(Map<String, dynamic> json) {
    return ItemCartModel(
        id: json['id'],
        productId: json['product_id'],
        quantity: json['quantity'],
        imageUrl: json['image_url'],
        name: json['name'],
        price: double.parse(json['price']),
        company: json['company']);
  }

  factory ItemCartModel.fromGoodsModel(GoodsModel item) {
    return ItemCartModel(
        id: item.id,
        productId: item.productId,
        quantity: 1,
        imageUrl: item.imageUrl,
        name: item.name,
        price: item.price,
        company: item.company);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? 0,
      'product_id': productId ?? '',
      'quantity': quantity,
      'image_url': imageUrl,
      'name': name,
      'price': price.toString(),
      'company': company,
    };
  }
}


