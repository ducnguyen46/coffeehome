import 'package:json_annotation/json_annotation.dart';

import 'delivery_info.dart';

part 'shipment.g.dart';

@JsonSerializable()
class Shipment {
  late BigInt id;
  late DeliveryInfo deliveryInfo;
  late bool isCompleted;
  late String shipperId;
  late String shipperName;
  late String shipperPhone;

  Shipment(this.id, this.deliveryInfo, this.isCompleted, this.shipperId,
      this.shipperName, this.shipperPhone,);

  factory Shipment.fromJson(Map<String, dynamic> json) => _$ShipmentFromJson(json);
  Map<String, dynamic> toJson() => _$ShipmentToJson(this);
}