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

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        id: json['id'] as int,
        code: json['code'] as String,
        description: json['description'] as String,
        name: json['name'] as String,
        value: (json['value'] as num).toDouble(),
        startDate: json['startDate'] as String,
        expiryDate: json['expiryDate'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id.toString(),
        'code': code,
        'description': description,
        'name': name,
        'value': value,
        'startDate': startDate,
        'expiryDate': expiryDate,
      };
}
