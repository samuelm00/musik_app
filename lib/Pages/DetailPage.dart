import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:musikapp/types/Musician.dart';
import 'package:musikapp/widgets/AlbumList.dart';

class DetailPage extends StatelessWidget {
  static final routeName = "/detail-section";

  @override
  Widget build(BuildContext context) {
    final Musician musician = ModalRoute.of(context).settings.arguments;

    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(children: [AlbumList(musicianId: musician.id)]),
    );
  }
}
