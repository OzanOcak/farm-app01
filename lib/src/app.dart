import 'dart:io';
import 'package:farmer/src/bloc/auth_bloc.dart';
import 'package:farmer/src/routes.dart';
import 'package:farmer/src/screens/login.dart';
import 'package:farmer/src/screens/landing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

final authBloc = AuthBloc();

class App extends StatefulWidget {
  // need to be stf to dispose bloc
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => authBloc),
        FutureProvider(create: (context) => authBloc.isLoggedIn())
      ],
      child: PlatformApp(),
    );
  }

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }
}

class PlatformApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isLoggedIn = Provider.of<bool>(context);

    if (Platform.isAndroid) {
      return MaterialApp(
        home: (isLoggedIn == null)
            ? loadingScreen(true)
            : (isLoggedIn == true) ? Landing() : Login(),
        onGenerateRoute: Routes.materialRoutes,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      );
    } else {
      return CupertinoApp(
        home: (isLoggedIn == null)
            ? loadingScreen(true)
            : (isLoggedIn == true) ? Landing() : Login(),
        onGenerateRoute: Routes.cupertinoRoutes,
        theme: CupertinoThemeData(scaffoldBackgroundColor: Colors.white),
      );
    }
  }

  Widget loadingScreen(bool isIOS) {
    return (isIOS)
        ? CupertinoPageScaffold(
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          )
        : Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
