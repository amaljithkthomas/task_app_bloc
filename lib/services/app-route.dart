import 'package:flutter/material.dart';
import 'package:tasks_app_bloc/screens/recycle_bin.dart';
import 'package:tasks_app_bloc/screens/tab_screen.dart';

class AppRoute {
  Route? onRouteGenerate(RouteSettings settings) {
    switch (settings.name) {
      case TabScreen.screenId:
        return MaterialPageRoute(
          builder: (_) => const TabScreen(),
        );
      case RecycleBin.screenId:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const TabScreen(),
        );
    }
  }
}
