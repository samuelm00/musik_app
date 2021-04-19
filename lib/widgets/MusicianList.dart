import 'package:flutter/material.dart';
import 'package:musikapp/Pages/DetailPage.dart';
import '../types/Musician.dart';

/**
 * 
 * 
 */
// class MusicianList extends StatefulWidget {
//   MusicianList({
//     Key key,
//     this.musicians,
//   }) : super(key: key);

//   final List<Musician> musicians;
//   List<Musician> markedAsFavorite = [];

//   @override
//   _MusicianListState createState() => _MusicianListState();
// }

// class _MusicianListState extends State<MusicianList> {
//   @override
//   Widget build(BuildContext context) {
//     List<Musician> allMusicians = widget.musicians + widget.markedAsFavorite;
//     var listView = ListView.separated(
//       shrinkWrap: true,
//       itemCount: allMusicians.length,
//       padding: const EdgeInsets.all(8),
//       itemBuilder: (BuildContext context, int index) => MusicianListItem(
//         musician: allMusicians[index],
//         markedAsFavorite: widget.markedAsFavorite,
//       ),
//       separatorBuilder: (BuildContext context, int index) => Divider(),
//     );
//     return listView;
//   }
// }

// class MusicianListItem extends StatefulWidget {
//   MusicianListItem({Key key, this.musician, this.markedAsFavorite})
//       : super(key: key);

//   Musician musician;
//   List<Musician> markedAsFavorite;

//   @override
//   _MusicianListItemState createState() => _MusicianListItemState();
// }

// class _MusicianListItemState extends State<MusicianListItem> {
//   void handleOnTab() {
//     setState(() => {
//           if (!widget.markedAsFavorite
//               .any((musician) => musician.id == widget.musician.id))
//             widget.markedAsFavorite.add(widget.musician)
//           else
//             widget.markedAsFavorite.remove(widget.musician)
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Color.fromARGB(255, 245, 247, 252),
//       ),
//       height: 50,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Container(
//               height: 50,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   bottomLeft: Radius.circular(20),
//                 ),
//                 border: Border.all(
//                   width: 1.0,
//                   color: Colors.grey[100],
//                   style: BorderStyle.solid,
//                 ),
//               ),
//               child: InkWell(
//                 highlightColor: Colors.transparent,
//                 splashColor: Colors.transparent,
//                 onTap: handleOnTab,
//                 child: Icon(
//                   widget.markedAsFavorite
//                           .any((musician) => musician.id == widget.musician.id)
//                       ? Icons.star
//                       : Icons.star_border,
//                   color: Color.fromARGB(255, 54, 69, 143),
//                   size: 30,
//                 ),
//               ),
//             ),
//             flex: 2,
//           ),
//           Expanded(
//               child: Center(
//                 child: Text(widget.musician.name),
//               ),
//               flex: 6),
//           Expanded(
//             flex: 2,
//             child: Container(
//               height: 50,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//               ),
//               child: InkWell(
//                 onTap: () => Navigator.pushNamed(context, DetailPage.routeName,
//                     arguments: widget.musician),
//                 child: Icon(
//                   Icons.arrow_right,
//                   color: Color.fromARGB(255, 54, 69, 143),
//                   size: 30,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

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
              child: InkWell(
                //on tab should change the star
                // this requires that this widget becomes
                // a statufl widget
                child: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 54, 69, 143),
                  size: 30,
                ),
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
