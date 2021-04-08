import 'package:flutter/material.dart';
import "dart:convert";
import 'package:http/http.dart' as http;
import 'package:musikapp/types/Musician.dart';
import 'package:musikapp/widgets/LoadingWave.dart';
import 'package:musikapp/widgets/MusicianList.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _userInput = "";
  String _errorMassageFetching = "";
  String _errorMassageTextField = "";
  final errorTextField = TextEditingController();
  List<Musician> musicians = [];
  bool loading = false;

  Future<http.Response> fetchAlbum(String artist) {
    return http.get("https://www.theaudiodb.com/api/v1/json/1/search.php?s=" +
        artist.toLowerCase());
  }

  Future<void> search() async {
    setState(() {
      loading = true;
    });

    if (_userInput.length == 0)
      setState(() {
        _errorMassageTextField = "Can't be empty";
      });
    else {
      try {
        dynamic response = json
            .decode(await fetchAlbum(_userInput).then((value) => value.body));

        if (response["artists"] != null) {
          List<Musician> list = [
            Musician(
                response["artists"][0]["idArtist"],
                response["artists"][0]["strArtist"],
                response["artists"][0]["strStyle"],
                response["artists"][0]["intFormedYear"],
                response["artists"][0]["strWebsite"],
                response["artists"][0]["strBiographyEN"])
          ];
          setState(() {
            musicians = list;
          });
        } else {
          setState(() {
            musicians = [];
          });
        }
        setState(() {
          if (_errorMassageFetching.length > 0) _errorMassageFetching = "";
          if (_errorMassageTextField.length > 0) _errorMassageTextField = "";
        });
      } catch (e) {
        print(e);
        setState(() {
          _errorMassageFetching =
              "An Error Occured while fetching data from the api!";
        });
      }
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: TextFormField(
                      onChanged: (String value) => setState(() {
                        _userInput = value;
                      }),
                      controller: errorTextField,
                      onFieldSubmitted: (value) => search(),
                      decoration: InputDecoration(
                        errorText: _errorMassageTextField.length > 0
                            ? "Can't be empty"
                            : null,
                        hintText: "Enter a brand or a musician",
                        border: OutlineInputBorder(),
                        labelText: "Musician",
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 60,
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 68, 86, 166),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: search,
                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            loading
                ? LoadingWave()
                : musicians.length != 0
                    ? MusicianList(musicians: musicians)
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Center(
                          child: Text(
                            _errorMassageFetching.length > 0
                                ? _errorMassageFetching
                                : "No musicians found!",
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
