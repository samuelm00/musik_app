import 'package:musikapp/types/Musician.dart';

class AppState {
  List<Musician> markedAsFavorite;
  String appBarTitle;
  String appBarTitleBefore;

  AppState(
      {this.markedAsFavorite = const [],
      this.appBarTitle = "Musik App",
      this.appBarTitleBefore = "Musik App"});
}
