import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:musikapp/types/Album.dart';
import 'package:http/http.dart' as http;
import 'package:musikapp/widgets/LoadingWave.dart';

/**
 * 
 * 
 */
class AlbumList extends StatefulWidget {
  final String musicianId;

  const AlbumList({Key key, @required this.musicianId}) : super(key: key);

  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  List<Album> albums;
  bool loading = true;

  Future<http.Response> fetchAlbums(String artitstId) {
    return http
        .get("https://theaudiodb.com/api/v1/json/1/album.php?i=" + artitstId);
  }

  @override
  void initState() {
    fetchAlbums(widget.musicianId).then((value) {
      List<dynamic> temp = parseResponse(json.decode(value.body));
      setState(() {
        loading = false;
        albums = temp;
      });
    });
  }

  List<Album> parseResponse(dynamic response) {
    List<Album> temp = [];
    for (int i = 0; i < response["album"].length; ++i) {
      temp.add(new Album(
          response["album"][i]["strAlbum"],
          response["album"][i]["strAlbumThumb"],
          response["album"][i]["intYearReleased"],
          response["album"][i]["strGenre"],
          response["album"][i]["strDescriptionEN"]));
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return LoadingWave();

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: albums.length,
      itemBuilder: (BuildContext context, int index) => AlbumCard(),
      padding: EdgeInsets.all(8),
    );
  }
}

/**
 * 
 * 
 */
class AlbumCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        child: SizedBox(height: 300, child: Text("hallo")),
      ),
    );
  }
}
