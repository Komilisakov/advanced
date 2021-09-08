import 'package:hive/hive.dart';

// part 'transaction.g.dart';
@HiveType(typeId: 0)
class User {
  @HiveField(0)
 late String username;
  @HiveField(0)
  late String password;

  User({required this.username,required this.password});

  User.fromJson(Map<dynamic, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
  };
}
