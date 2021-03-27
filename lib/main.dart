import 'package:flutter/material.dart';
import 'package:musikapp/Pages/DetailPage.dart';
import 'Pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        DetailPage.routeName: (BuildContext context) => DetailPage()
      },
      home: MyHomePage(title: 'Musik Application'),
      initialRoute: "/",
    );
  }
}
