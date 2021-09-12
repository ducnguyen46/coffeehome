import 'package:json_annotation/json_annotation.dart';

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

  factory DeliveryInfo.fromJson(Map<String, dynamic> json) => DeliveryInfo(
        id: json['id'] as int?,
        receiver: json['receiver'] as String,
        phoneNumber: json['phoneNumber'] as String,
        address: json['address'] as String,
        note: json['note'] as String,
        isDefault: json['isDefault'] as bool,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'receiver': receiver,
        'phoneNumber': phoneNumber,
        'address': address,
        'note': note,
        'isDefault': isDefault,
      };
}
