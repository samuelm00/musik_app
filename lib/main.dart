import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:musikapp/Pages/DetailPage.dart';
import 'package:musikapp/redux/actions.dart';
import 'package:musikapp/redux/appState.dart';
import 'package:musikapp/redux/reducer.dart';
import 'package:musikapp/types/Colors.dart';
import 'package:musikapp/Pages/FavoritePage.dart';
import 'package:musikapp/widgets/Footer.dart';
import 'Pages/HomePage.dart';
import "package:redux/redux.dart";

void main() {
  runApp(MyApp());
}

/**
 * 
 * 
 */
class MyApp extends StatelessWidget {
  final Store<AppState> store =
      Store<AppState>(appReducer, initialState: AppState(markedAsFavorite: []));

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: MaterialColor(0xFF4456A6, primarySwatch),
        ),
        routes: <String, WidgetBuilder>{
          DetailPage.routeName: (BuildContext context) => WillPopScope(
                onWillPop: () {
                  StoreProvider.of<AppState>(context)
                      .dispatch(UpdateAppBarTitleBack());
                  Navigator.pop(context);
                },
                child: ContentContainer(
                  widget: DetailPage(),
                ),
              ),
          FavoritePage.routeName: (BuildContext context) => WillPopScope(
                onWillPop: () {
                  StoreProvider.of<AppState>(context)
                      .dispatch(UpdateAppBarTitleBack());
                  Navigator.pop(context);
                },
                child: ContentContainer(
                  widget: FavoritePage(),
                ),
              )
        },
        home: ContentContainer(widget: MyHomePage(title: 'Musik Application')),
        initialRoute: "/",
      ),
    );
  }
}

/**
 * 
 * 
 */
class ContentContainer extends StatelessWidget {
  ContentContainer({
    this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      converter: (store) => store.state.appBarTitle,
      builder: (context, String title) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(title),
          actions: [
            ModalRoute.of(context).settings.name != "/"
                ? Container()
                : IconButton(
                    icon: Icon(Icons.star),
                    onPressed: () {
                      StoreProvider.of<AppState>(context)
                          .dispatch(UpdateAppBarTitle("Favorites"));
                      Navigator.pushNamed(context, FavoritePage.routeName);
                    })
          ],
        ),
        body: Padding(padding: const EdgeInsets.all(8.0), child: widget),
        bottomSheet: Footer(),
      ),
    );
  }
}
