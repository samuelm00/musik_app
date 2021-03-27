import 'package:flutter/material.dart';
import 'package:musikapp/Pages/DetailPage.dart';
import '../types/Musician.dart';

/**
 * 
 * 
 */
class MusicianList extends StatelessWidget {
  const MusicianList({
    Key key,
    @required this.musicians,
  }) : super(key: key);

  final List<Musician> musicians;

  @override
  Widget build(BuildContext context) {
    var listView = ListView.separated(
      shrinkWrap: true,
      itemCount: musicians.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (BuildContext context, int index) =>
          MusicianListItem(musician: musicians[index]),
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
    return InkWell(
      onTap: () => Navigator.pushNamed(context, DetailPage.routeName,
          arguments: musician),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              flex: 2,
            ),
            Expanded(child: Text(musician.name), flex: 8),
          ],
        ),
      ),
    );
  }
}
