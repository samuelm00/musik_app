import 'package:flutter/material.dart';
import "dart:convert";
import 'package:http/http.dart' as http;
import 'package:musikapp/Musician.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _userInput = "";
  List<Musician> musicians = [];

  Future<http.Response> fetchAlbum(String artist) {
    return http.get("https://www.theaudiodb.com/api/v1/json/1/search.php?s=" +
        artist.toLowerCase());
  }

  Future<int> search() async {
    dynamic response =
        json.decode(await fetchAlbum(_userInput).then((value) => value.body));

    List<Musician> list = [
      Musician(
          response["artists"][0]["strArtist"],
          response["artists"][0]["strStyle"],
          response["artists"][0]["intFormedYear"],
          response["artists"][0]["strWebsite"],
          response["artists"][0]["strBiographyEN"])
    ];

    setState(() {
      musicians = list;
    });

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (String value) => setState(() {
                    _userInput = value;
                  }),
                  decoration:
                      InputDecoration(hintText: "Enter a brand or a musician"),
                ),
              ),
              Text(musicians.length > 0
                  ? musicians[0].biography
                  : "no data fetched")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: search,
        tooltip: "search",
        child: Icon(Icons.search),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
