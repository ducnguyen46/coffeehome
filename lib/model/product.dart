import 'package:coffeehome/model/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  late int id;
  late String name;
  late double price;
  late String image;
  late Category category;

  Product(this.id, this.name, this.price, this.image, this.category);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
