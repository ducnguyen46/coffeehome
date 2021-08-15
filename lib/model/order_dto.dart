import 'package:coffeehome/model/item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {
  late List<Item> items;
  late int voucherId;
  late int deliveryId;

  OrderDto(
    this.items,
    this.voucherId,
    this.deliveryId,
  );

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);
}
