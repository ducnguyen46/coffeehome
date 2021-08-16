import 'package:json_annotation/json_annotation.dart';

part 'delivery_info.g.dart';

@JsonSerializable()
class DeliveryInfo {
  int? id;
  late String receiver;
  late String phoneNumber;
  late String address;
  late String note;
  late bool isDefault;

  DeliveryInfo({
    this.id,
    required this.receiver,
    required this.phoneNumber,
    required this.address,
    required this.note,
    required this.isDefault,
  });

  factory DeliveryInfo.fromJson(Map<String, dynamic> json) =>
      _$DeliveryInfoFromJson(json);
  Map<String, dynamic> toJson() => _$DeliveryInfoToJson(this);
}
