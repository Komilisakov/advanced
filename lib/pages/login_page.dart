import 'package:advanced/model/user_model.dart';
import 'package:advanced/services/db_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static final String id = "login_page";

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  late TextEditingController _lgctrl;
  late TextEditingController _pwdctrl;
  final _focusNode = FocusNode();
  String login = "";
  String password = "";
  void _doLogin() async{
    String username = _lgctrl.text.toString().trim();
    String password = _pwdctrl.text.toString().trim();
    var user = new User(username: username,password: password);
    HiveDB().storeUser(user);
    var user2 = HiveDB().loadUser();
    print(user2.username);
    print(user2.password);
  }
  @override
  void initState() {
    print("initState");
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      print("Has focus: ${_focusNode.hasFocus}");
    });
    _lgctrl = TextEditingController();
    _pwdctrl = TextEditingController();
    var user2 = HiveDB().loadUser();
    _lgctrl.text = user2.username;
    _pwdctrl.text = user2.password;
    print(user2.username);
    print(user2.password);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode.dispose();
    _lgctrl.dispose();
    _pwdctrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            color: Colors.grey[300],
            child: ListView(
              children: [Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Container(
                          height: 150,
                          // margin: EdgeInsets.symmetric(horizontal: 80),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/top_image.png"),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                      ),
                      Text(
                        "Welcome back!",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Log in to your existant account of Q Alure",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextField(
                          controller: _lgctrl,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.account_circle,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue, width: 1),
                                  borderRadius: BorderRadius.circular(50)),
                              hintText: "Email"),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          // border: Border.all(color: Colors.blue,width: 2)
                        ),
                        child: TextField(
                          obscureText: true,
                          focusNode: _focusNode,
                          controller: _pwdctrl,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.lock_open),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue, width: 1),
                                borderRadius: BorderRadius.circular(50)),
                            hintText: "password",
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                          Text(
                            "Forgout password?",
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                      ),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromRGBO(16, 50, 147, 1),
                        ),
                        child: TextButton(
                            onPressed: () {
                              _doLogin();
                              print(_lgctrl.text);
                              print(_pwdctrl.text);

                            },
                            child: Text("LOG IN", style: TextStyle(color: Colors.white))),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(" Or connect using", style: TextStyle(color: Colors.grey)),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(42, 72, 123, 1)),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.facebook),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text("Facebook",
                                            style: TextStyle(color: Colors.white)),
                                      ]))),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(233, 44, 43, 1)),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text("Google",
                                            style: TextStyle(color: Colors.white)),
                                      ]))),
                        ],
                      )
                    ],
              ),]
            ),
          )),
    );
  }
}
