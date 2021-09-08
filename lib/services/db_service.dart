import 'package:advanced/model/user_model.dart';
import 'package:hive/hive.dart';

class HiveDB {
  var box = Hive.box('pdp_online');

  void storeUser(User user) async {
    print("user.toJson()");
    print(user.toJson());
    box.put("user", user.toJson());
  }

  User loadUser() {
    var useString = box.get('user');
    var user = User(username: '',password: "");//.fromJson(box.get('user'));
    if (useString != null){
      print("useString");
      print(useString);
       user =new User.fromJson(useString);
    }
    print(user);

    return user;
  }

  void removeUser() async {
    box.delete("user");
  }
}
