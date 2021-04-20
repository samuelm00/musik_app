import 'package:musikapp/types/Musician.dart';

class UpdateMarkedAsFavorite {
  final Musician newFavorite;

  UpdateMarkedAsFavorite(this.newFavorite);
}

/**
 * 
 */
class UpdateAppBarTitle {
  final String newTitle;

  UpdateAppBarTitle(this.newTitle);
}

/**
 * 
 */
class UpdateAppBarTitleBack {
  UpdateAppBarTitleBack();
}
