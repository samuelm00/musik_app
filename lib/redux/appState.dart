import 'package:musikapp/types/Musician.dart';

class AppState {
  List<Musician> markedAsFavorite;

  AppState({this.markedAsFavorite = const []});
}
