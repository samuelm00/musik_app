import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:musikapp/redux/appState.dart';
import 'package:musikapp/types/Musician.dart';
import 'package:musikapp/widgets/AlbumList.dart';
import 'package:musikapp/widgets/MusicianList.dart';

class FavoritePage extends StatelessWidget {
  static final routeName = "/favorite-section";

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Musician>>(
      converter: (store) => store.state.markedAsFavorite,
      builder: (context, List<Musician> markedAsFavorite) =>
          SingleChildScrollView(
        physics: ScrollPhysics(),
        child: markedAsFavorite != null && !markedAsFavorite.isEmpty
            ? Column(children: [
                Text(
                  "Favorites:",
                  style: TextStyle(fontSize: 30),
                ),
                MusicianList(musicians: markedAsFavorite),
              ])
            : Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Center(
                  child: Text("No Favorites"),
                ),
              ),
      ),
    );
  }
}
