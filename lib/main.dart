import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/providers.dart';
import 'config/routes.dart';

void main() {
  runApp(MultiProvider(
    providers: appProviders,
    child: const ShtushnyiApp(),
  ));
}

class ShtushnyiApp extends StatelessWidget {
  const ShtushnyiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

    return MaterialApp(
      scaffoldMessengerKey: scaffoldKey,
      title: 'Shtushnyi App',
      routes: AppRouter().routes,
      initialRoute: AppRouter.home,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
        }),
      ),
    );
  }
}
