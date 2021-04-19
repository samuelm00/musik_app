import 'package:flutter/material.dart';
import 'package:musikapp/types/Colors.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ModalRoute.of(context).settings.name == "/" ? null : 0,
      color: primarySwatch[900],
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Samuel Mitterrutzner",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            Text(
              "11911464",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
