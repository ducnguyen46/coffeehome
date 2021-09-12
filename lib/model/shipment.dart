import 'delivery_info.dart';

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

  factory Shipment.fromJson(Map<String, dynamic> json) => Shipment(
        id: json['id'] as int,
        deliveryInfo:
            DeliveryInfo.fromJson(json['deliveryInfo'] as Map<String, dynamic>),
        isCompleted: json['isCompleted'] as bool,
        shipperId: json['shipperId'] as String,
        shipperName: json['shipperName'] as String,
        shipperPhone: json['shipperPhone'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'deliveryInfo': deliveryInfo,
        'isCompleted': isCompleted,
        'shipperId': shipperId,
        'shipperName': shipperName,
        'shipperPhone': shipperPhone,
      };
}
