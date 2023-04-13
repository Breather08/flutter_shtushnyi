import 'package:flutter/material.dart';

class RouteManager {
  final Map<String, WidgetBuilder> _routes = {};
  Map<String, WidgetBuilder> get routes => _routes;

  static T extractArguments<T>(BuildContext ctx, {T? arguments}) {
    return ModalRoute.of(ctx)!.settings.arguments as T;
  }

  void addRoute(String name, WidgetBuilder builder) {
    _routes[name] = builder;
  }
}
