class User {
  int? id;
  late String fullName;
  late String dateOfBirth;
  late String email;
  late String username;
  late String reward;
  late int point;
  late bool isActived;

  User.init();

  User.all({
    this.id,
    required this.fullName,
    required this.dateOfBirth,
    required this.email,
    required this.username,
    required this.reward,
    required this.point,
    required this.isActived,
  });

  factory User.fromJson(Map<String, dynamic> json) => User.all(
        id: json['id'] as int,
        fullName: json['fullName'] as String,
        dateOfBirth: json['dateOfBirth'] as String,
        email: json['email'] as String,
        username: json['username'] as String,
        reward: json['reward'] as String,
        point: json['point'] as int,
        isActived: json['isActived'] as bool,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'fullName': fullName,
        'dateOfBirth': dateOfBirth,
        'email': email,
        'username': username,
        'reward': reward,
        'point': point,
        'isActived': isActived,
      };
}
