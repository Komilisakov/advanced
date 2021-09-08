import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController confirm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    confirm = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              color: Colors.grey[300],
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Let's gGet Started!",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text("Create an account to Q Allure to get all features"),
                      editBox(name, Icons.drive_file_rename_outline, "Name",
                          "name"),
                      editBox(email, Icons.email_outlined, "Email", "email"),
                      editBox(phone, Icons.phone_android_rounded, "Phone",
                          "number"),
                      editBox(password, Icons.lock, "Passowrd", "password"),
                      editBox(
                          confirm, Icons.lock, "Confirm Password", "password"),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue,
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "CREATE",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(" Already have account? "),
                          TextButton(
                              onPressed: (){},
                              child: Text("Login here")),
                        ],
                      )
                    ],
                  ),
                ],
              ))),
    );
  }

  Widget editBox(TextEditingController controller, IconData icon,
      String hinText, String type) {
    return Container(
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        keyboardType: type == "number"
            ? TextInputType.number
            : type == "email"
                ? TextInputType.emailAddress
                : type == "password"
                    ? TextInputType.visiblePassword
                    : TextInputType.text,
        obscureText: type == "password" ? true : false,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 1),
                borderRadius: BorderRadius.circular(50)),
            hintText: hinText),
      ),
    );
  }
}
