import 'package:json_annotation/json_annotation.dart';

part 'voucher.g.dart';

@JsonSerializable()
class Voucher {
  late BigInt id;
  late String code;
  late String description;
  late String name;
  late double value;
  late String startDate;
  late String expiryDate;

  Voucher(
    this.id,
    this.code,
    this.description,
    this.name,
    this.value,
    this.startDate,
    this.expiryDate,
  );

  factory Voucher.fromJson(Map<String, dynamic> json) =>
      _$VoucherFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherToJson(this);
}
