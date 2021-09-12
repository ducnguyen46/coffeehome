import 'package:json_annotation/json_annotation.dart';

class Category {
  late int id;
  late String name;

  Category(this.id, this.name);

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        json['id'] as int,
        json['name'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
      };
}
