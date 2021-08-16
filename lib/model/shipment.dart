import 'package:json_annotation/json_annotation.dart';

import 'delivery_info.dart';

part 'shipment.g.dart';

@JsonSerializable()
class Shipment {
  int id;
  late DeliveryInfo deliveryInfo;
  late bool isCompleted;
  late String shipperId;
  late String shipperName;
  late String shipperPhone;

  Shipment({
    required this.id,
    required this.deliveryInfo,
    required this.isCompleted,
    required this.shipperId,
    required this.shipperName,
    required this.shipperPhone,
  });

  factory Shipment.fromJson(Map<String, dynamic> json) =>
      _$ShipmentFromJson(json);
  Map<String, dynamic> toJson() => _$ShipmentToJson(this);
}
