import 'package:flutter/material.dart';
import 'package:musikapp/types/Musician.dart';
import 'package:musikapp/widgets/AlbumList.dart';
import 'package:musikapp/widgets/MusicianList.dart';

class FavoritePage extends StatelessWidget {
  static final routeName = "/favorite-section";

  @override
  Widget build(BuildContext context) {
    final List<Musician> musicians = ModalRoute.of(context).settings.arguments;

    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: musicians != null && !musicians.isEmpty
          ? Column(children: [MusicianList(musicians: musicians)])
          : Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Center(
                child: Text("No Favorites"),
              ),
            ),
    );
  }
}
