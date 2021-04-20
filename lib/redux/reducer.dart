import 'package:musikapp/redux/actions.dart';
import 'package:musikapp/redux/appState.dart';

AppState markedAsFavoriteReducer(AppState currentState, dynamic action) {
  if (action is UpdateMarkedAsFavorite) {
    if (currentState.markedAsFavorite
        .any((element) => element.id == action.newFavorite.id))
      return currentState;
    currentState.markedAsFavorite.add(action.newFavorite);
    return AppState(markedAsFavorite: currentState.markedAsFavorite);
  }
  return currentState;
}
