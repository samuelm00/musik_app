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
      itemBuilder: (BuildContext context, int index) => AlbumCard(
        album: albums[index],
      ),
      padding: EdgeInsets.all(8),
    );
  }
}

/**
 * 
 * 
 */
class AlbumCard extends StatelessWidget {
  AlbumCard({this.album});

  Album album;

  String getFirst40Word(List<String> words) {
    return words
        .getRange(0, words.length > 40 ? 40 : words.length)
        .join(" ")
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SizedBox(
            height: 300,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      album.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(album.year.toString()),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      album.imgUrl,
                      height: 150,
                      width: 150,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          album.genre != null ? album.genre : "",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Divider(),
                        Container(
                          width: 200,
                          child: Text(
                            album.description != null
                                ? getFirst40Word(album.description.split(" ")) +
                                    "..."
                                : "",
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
