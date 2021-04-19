import 'package:flutter/material.dart';
import 'package:musikapp/Pages/DetailPage.dart';
import 'package:musikapp/types/Colors.dart';
import 'package:musikapp/Pages/FavoritePage.dart';
import 'package:musikapp/widgets/Footer.dart';
import 'Pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

/**
 * 
 * 
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF4456A6, primarySwatch),
      ),
      routes: <String, WidgetBuilder>{
        DetailPage.routeName: (BuildContext context) =>
            ContentContainer(widget: DetailPage()),
        FavoritePage.routeName: (BuildContext context) =>
            ContentContainer(widget: FavoritePage())
      },
      home: ContentContainer(widget: MyHomePage(title: 'Musik Application')),
      initialRoute: "/",
    );
  }
}

/**
 * 
 * 
 */
class ContentContainer extends StatelessWidget {
  ContentContainer({
    this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Musik app"),
        actions: [
          ModalRoute.of(context).settings.name != "/"
              ? Container()
              : IconButton(
                  icon: Icon(Icons.star),
                  onPressed: () {
                    Navigator.pushNamed(context, FavoritePage.routeName);
                  })
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(8.0), child: widget),
      bottomSheet: Footer(),
    );
  }
}
