import 'package:musikapp/redux/actions.dart';
import 'package:musikapp/redux/appState.dart';

AppState appReducer(AppState currentState, dynamic action) {
  if (action is UpdateMarkedAsFavorite) {
    if (currentState.markedAsFavorite
        .any((element) => element.id == action.newFavorite.id)) {
      return AppState(
        appBarTitle: currentState.appBarTitle,
        appBarTitleBefore: currentState.appBarTitleBefore,
        markedAsFavorite: currentState.markedAsFavorite
            .where((element) => element.id != action.newFavorite.id)
            .toList(),
      );
    }
    return AppState(
      appBarTitle: currentState.appBarTitle,
      appBarTitleBefore: currentState.appBarTitleBefore,
      markedAsFavorite: currentState.markedAsFavorite + [action.newFavorite],
    );
  }
  if (action is UpdateAppBarTitle) {
    return AppState(
      markedAsFavorite: currentState.markedAsFavorite,
      appBarTitle: action.newTitle,
      appBarTitleBefore: currentState.appBarTitle,
    );
  }
  if (action is UpdateAppBarTitleBack) {
    return AppState(
      appBarTitle: currentState.appBarTitleBefore,
      appBarTitleBefore: currentState.appBarTitleBefore,
      markedAsFavorite: currentState.markedAsFavorite,
    );
  }
  return currentState;
}
