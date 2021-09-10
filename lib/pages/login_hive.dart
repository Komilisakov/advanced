import 'package:advanced/model/user_model.dart';
import 'package:advanced/pages/sign_in_hive.dart';
import 'package:advanced/services/db_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginHive extends StatefulWidget {
  const LoginHive({Key? key}) : super(key: key);

  @override
  _LoginHiveState createState() => _LoginHiveState();
}

class _LoginHiveState extends State<LoginHive> {
  late TextEditingController name;
  late TextEditingController password;
  late User user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController();
    password = TextEditingController();
    user = HiveDB().loadUser();
    name.text = user.username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage("assets/images/6.png"),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Welcome Back!",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Sign in to continue",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            HMTextField(name, Icons.account_circle, "User name", "name"),
            SizedBox(
              height: 16,
            ),
            InpuText(controller: password, icon: Icons.lock_open, hintText: "Password",type: "password"),
            SizedBox(
              height: 35,
            ),
            Text("Forgout password?", style: TextStyle(color: Colors.grey)),
            SizedBox(
              height: 35,
            ),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
                  Colors.blueAccent.withOpacity(0.5),
                  Colors.blueAccent,
                ]),
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                  onPressed: () {
                    user.username = name.text;
                    user.password = password.text;
                    HiveDB().storeUser(user);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SignInHive()),);
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 35,
                  )),
            ),
            SizedBox(
              height: 75,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Don't have on account?",
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInHive()),
                    );
                  },
                  child: Text("SIGN UP? ",
                      style: TextStyle(color: Colors.blueAccent))),
              SizedBox(
                height: 20,
              ),
            ])
            // HMTextField(),
          ],
        ),
      )),
    );
  }

  Widget HMTextField(TextEditingController controller, IconData icon,
      String hintText, String type) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        style: TextStyle(color: Colors.grey),
        controller: controller,
        keyboardType: type == "number"
            ? TextInputType.number
            : type == "email"
                ? TextInputType.emailAddress
                : type == "password"
                    ? TextInputType.visiblePassword
                    : TextInputType.text,
        obscureText: type == "password" ? true : false,
        decoration: InputDecoration(
            hintText: "User name",
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey, width: 2, style: BorderStyle.solid),
            )),
      ),
    );
  }
}

class InpuText extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? icon;
  final String? hintText;
  final String? type;

  const InpuText({
    Key? key,
    this.controller,
    this.icon,
    this.hintText,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: controller,
        keyboardType: type == "number"
            ? TextInputType.number
            : type == "email"
                ? TextInputType.emailAddress
                : type == "password"
                    ? TextInputType.visiblePassword
                    : TextInputType.text,
        obscureText: type == "password" ? true : false,
        decoration: InputDecoration(
            hintText: this.hintText,
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey, width: 2, style: BorderStyle.solid),
            )),
      ),
    );
  }
}
