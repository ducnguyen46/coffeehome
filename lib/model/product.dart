import 'package:coffeehome/model/category.dart';
import 'package:json_annotation/json_annotation.dart';

class Product {
  late int id;
  late String name;
  late double price;
  late String image;
  late Category category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int,
        name: json['name'] as String,
        price: (json['price'] as num).toDouble(),
        image: json['image'] as String,
        category: Category.fromJson(json['category'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'price': price,
        'image': image,
        'category': category,
      };
}
