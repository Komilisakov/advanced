import 'package:hive/hive.dart';

part 'user_reg.g.dart';

@HiveType(typeId: 0)
class UserReg extends HiveObject  {
  @HiveField(0)
  late String username;
  @HiveField(1)
  late String email;
  @HiveField(2)
  late String phone;
  @HiveField(3)
  late String password;
}
