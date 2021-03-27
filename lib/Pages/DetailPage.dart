import 'package:flutter/material.dart';
import 'package:musikapp/types/Musician.dart';

class DetailPage extends StatelessWidget {
  static final routeName = "/detail-section";

  @override
  Widget build(BuildContext context) {
    final Musician musician = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Musikian App"),
      ),
      body: Column(children: [Text(musician.name)]),
    );
  }
}
