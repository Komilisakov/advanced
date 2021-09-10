import 'package:hive/hive.dart';

// part 'transaction.g.dart';
class User {
 late String username;
  late String password;
  User({required this.username,required this.password});
  User.fromJson(Map<dynamic, dynamic> json)
      : username = json['username'],
        password = json['password'];
  Map<dynamic, dynamic> toJson() => {
    'username': username,
    'password': password,
  };
}
