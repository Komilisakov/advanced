import 'package:advanced/icons/icons.dart';
import 'package:flutter/material.dart';

class LoginOval extends StatefulWidget {
  const LoginOval({Key? key}) : super(key: key);

  @override
  _LoginOvalState createState() => _LoginOvalState();
}

class _LoginOvalState extends State<LoginOval> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(23, 109, 103, 1),
        body: ListView(
          children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(40, 40, 0, 20),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: AssetImage("assets/images/6.png"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 0, 8),
                  child: Text("Welcome",
                      style: TextStyle(color: Color.fromRGBO(38, 156, 156, 1)))),
              Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 0, 40),
                  child: Text("Sign IN",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold))),
              Container(
                child: Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          decoration: InputDecoration(hintText: "Enter email"),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          decoration: InputDecoration(hintText: "Enter password"),
                        ),
                        Center(
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(color: Colors.grey),
                              )),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(23, 109, 103, 1),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: TextButton(
                              onPressed: () {},
                              child: Text("Sign In",
                                  style: TextStyle(color: Colors.white))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(child: Text("OR",style: TextStyle(color: Colors.grey),)),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          IconButton(onPressed: (){}, icon: Icon(SocialIcons.facebook,color: Colors.blueAccent,)),
                           SizedBox(width: 16,),
                           IconButton(onPressed: (){}, icon: Icon(SocialIcons.twitter , color: Colors.blue)),
                            SizedBox(width: 16,),
                            IconButton(onPressed: (){}, icon: Icon(SocialIcons.instagram, color: Colors.black87)),
                          ],
                        ),
  Row(
    children:[
      TextButton(onPressed: (){}, child: Text("SignUp"))
      ]
  )
                      ],
                    )),
              )
            ],
          ),
      ]
        )
    );
  }
}
