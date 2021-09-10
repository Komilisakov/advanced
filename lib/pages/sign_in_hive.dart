import 'package:advanced/model/user_reg.dart';
import 'package:advanced/pages/login_hive.dart';
import 'package:advanced/services/db_service.dart';
import 'package:flutter/material.dart';

class SignInHive extends StatefulWidget {
  const SignInHive({Key? key}) : super(key: key);

  @override
  _SignInHiveState createState() => _SignInHiveState();
}

class _SignInHiveState extends State<SignInHive> {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late UserReg userReg;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userReg = HiveDB().readUserReg();

    name = TextEditingController(text: userReg.username);
    email = TextEditingController(text: userReg.email);
    phone = TextEditingController(text: userReg.phone);
    password = TextEditingController(text: userReg.password);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.black87,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
          children:[
            Text("Create \n Account",style: TextStyle(color: Colors.white, fontSize: 40,), textAlign: TextAlign.center),
            SizedBox(height: 60,),
            InpuText(controller: name, icon: Icons.account_circle_outlined, hintText: "Name",type: "name"),
            SizedBox(height: 16,),
            InpuText(controller: email, icon: Icons.email_outlined, hintText: "E-mail",type: "email"),
            SizedBox(height: 16,),
            InpuText(controller: phone, icon: Icons.phone, hintText: "Phone Number",type: "number"),
            SizedBox(height: 16,),
            InpuText(controller: password, icon: Icons.lock_outline, hintText: "Password",type: "password"),
            SizedBox(height: 45,),
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
                    userReg.username = name.text;
                    userReg.email = email.text;
                    userReg.phone = phone.text;
                    userReg.password = password.text;
                    HiveDB().UserRegister(userReg);
                    // user.username = name.text;
                    // user.password = password.text;
                    // HiveDB().storeUser(user);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SignInHive()),);
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 35,
                  )),
            ),
            SizedBox(height: 70,),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Already have acoount?",
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginHive()),
                    );
                  },
                  child: Text("SIGN IN? ",
                      style: TextStyle(color: Colors.blueAccent))),
              SizedBox(
                height: 20,
              ),
            ])
          ]
        ),
      ),
    );
  }
}
