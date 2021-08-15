import 'package:coffeehome/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
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

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
