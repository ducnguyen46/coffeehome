import 'package:json_annotation/json_annotation.dart';

part 'voucher.g.dart';

@JsonSerializable()
class Voucher {
  late int id;
  late String code;
  late String description;
  late String name;
  late double value;
  late String startDate;
  late String expiryDate;

  Voucher({
    required this.id,
    required this.code,
    required this.description,
    required this.name,
    required this.value,
    required this.startDate,
    required this.expiryDate,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) =>
      _$VoucherFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherToJson(this);
}
