import 'package:flutter/material.dart';
import 'config/routes.dart';

void main() {
  runApp(const ShtushnyiApp());
}

class ShtushnyiApp extends StatelessWidget {
  const ShtushnyiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
