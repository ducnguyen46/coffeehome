import 'package:coffeehome/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

class Item {
  int? id;
  late Product product;
  late double priceIn;
  late int quantity;
  late String type;
  late String size;
  late String ice;
  late String sugar;

  Item({
    this.id,
    required this.product,
    required this.priceIn,
    required this.quantity,
    required this.type,
    required this.size,
    required this.ice,
    required this.sugar,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'] as int?,
        product: Product.fromJson(json['product'] as Map<String, dynamic>),
        priceIn: (json['priceIn'] as num).toDouble(),
        quantity: json['quantity'] as int,
        type: json['type'] as String,
        size: json['size'] as String,
        ice: json['ice'] as String,
        sugar: json['sugar'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'product': product,
        'priceIn': priceIn,
        'quantity': quantity,
        'type': type,
        'size': size,
        'ice': ice,
        'sugar': sugar,
      };
}
