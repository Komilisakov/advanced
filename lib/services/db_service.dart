import 'package:advanced/model/user_model.dart';
import 'package:advanced/model/user_reg.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
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
       user = new User.fromJson(useString);
    }
    print(user);

    return user;
  }

  void removeUser() async {
    box.delete("user");
  }
  void UserRegister(UserReg userReg){
    box.put("user_reg",userReg);
  }

  UserReg readUserReg(){
    UserReg userReg = UserReg()..username = ""..password = ""..phone = ""..email = "";
print("box.get('user_reg')");
    print(box.get("user_reg"));
    if(box.get("user_reg") != null){
      userReg = box.get("user_reg");
      print("userReg.username");
      print(userReg.username);
    }
    return userReg;
    box.get("user_reg");
  }


}
