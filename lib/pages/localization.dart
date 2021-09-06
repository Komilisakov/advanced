import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class LocalLanguage extends StatefulWidget {
  const LocalLanguage({Key? key}) : super(key: key);

  @override
  _LocalLanguageState createState() => _LocalLanguageState();
}

class _LocalLanguageState extends State<LocalLanguage> {
  bool _isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(child: Text(
                'welcome',
                style: TextStyle(fontSize: 20),
              ).tr(),),
            ]),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      height: 48,
                      margin: EdgeInsets.all(8),
                      color: Colors.green,
                      child: TextButton(
                        onPressed: () {
                          context.locale = Locale("en", "US");
                        },
                        child: Text(
                          "English",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
                Expanded(
                  child: Container(
                      height: 48,
                      margin: EdgeInsets.all(8),
                      color: Colors.red,
                      child: TextButton(
                        onPressed: () {
                          context.locale = Locale("ru", "RU");
                        },
                        child: Text(
                          "Russian",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
                Expanded(
                  child: Container(
                      height: 48,
                      margin: EdgeInsets.all(8),
                      color: Colors.blue,
                      child: TextButton(
                        onPressed: () {
                          context.locale = Locale("uz", "UZ");
                        },
                        child: Text(
                          "Uzbek",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
                Expanded(
                  child: Container(
                      height: 48,
                      margin: EdgeInsets.all(8),
                      color: Colors.orange,
                      child: TextButton(
                        onPressed: () {
                          context.locale = Locale("fr", "FR");
                        },
                        child: Text(
                          "French",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
