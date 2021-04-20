import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:musikapp/Pages/DetailPage.dart';
import 'package:musikapp/redux/actions.dart';
import 'package:musikapp/redux/appState.dart';
import 'package:musikapp/types/Colors.dart';
import '../types/Musician.dart';

/**
 * 
 * 
 */
class MusicianList extends StatelessWidget {
  MusicianList({
    Key key,
    this.musicians,
  }) : super(key: key);

  final List<Musician> musicians;

  @override
  Widget build(BuildContext context) {
    var listView = ListView.separated(
      shrinkWrap: true,
      itemCount: musicians.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (BuildContext context, int index) => MusicianListItem(
        musician: musicians[index],
      ),
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
    return listView;
  }
}

/**
 * 
 * 
 */
class MusicianListItem extends StatelessWidget {
  const MusicianListItem({
    Key key,
    @required this.musician,
  }) : super(key: key);

  final Musician musician;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 245, 247, 252),
      ),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey[100],
                  style: BorderStyle.solid,
                ),
              ),
              child: PopupMenuButton<int>(
                child: Icon(Icons.person, color: primarySwatch[900]),
                onSelected: (int index) => {
                  StoreProvider.of<AppState>(context)
                      .dispatch(UpdateMarkedAsFavorite(musician))
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Icon(Icons.star), Text("Mark as Favorite")],
                    ),
                  )
                ],
              ),
            ),
            flex: 2,
          ),
          Expanded(
              child: Center(
                child: Text(musician.name),
              ),
              flex: 6),
          Expanded(
            flex: 2,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, DetailPage.routeName,
                    arguments: musician),
                child: Icon(
                  Icons.arrow_right,
                  color: Color.fromARGB(255, 54, 69, 143),
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
class MusicianList extends StatelessWidget {
  MusicianList({
    Key key,
    this.musicians,
  }) : super(key: key);

  final List<Musician> musicians;

  @override
  Widget build(BuildContext context) {
    var listView = ListView.separated(
      shrinkWrap: true,
      itemCount: musicians.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (BuildContext context, int index) => MusicianListItem(
        musician: musicians[index],
      ),
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
    return listView;
  }
}

/**
 * 
 * 
 */
class MusicianListItem extends StatelessWidget {
  const MusicianListItem({
    Key key,
    @required this.musician,
  }) : super(key: key);

  final Musician musician;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 245, 247, 252),
      ),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey[100],
                  style: BorderStyle.solid,
                ),
              ),
              child: PopupMenuButton<int>(
                child: Icon(Icons.person, color: primarySwatch[900]),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Icon(Icons.star), Text("Mark as Favorite")],
                    ),
                  )
                ],
              ),
            ),
            flex: 2,
          ),
          Expanded(
              child: Center(
                child: Text(musician.name),
              ),
              flex: 6),
          Expanded(
            flex: 2,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, DetailPage.routeName,
                    arguments: musician),
                child: Icon(
                  Icons.arrow_right,
                  color: Color.fromARGB(255, 54, 69, 143),
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

*/
