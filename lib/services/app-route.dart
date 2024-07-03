import 'package:flutter/material.dart';
import 'package:tasks_app_bloc/screens/recycle_bin.dart';
import 'package:tasks_app_bloc/screens/tasks_screen.dart';

class AppRoute {
  Route? onRouteGenerate(RouteSettings settings) {
    switch (settings.name) {
      case TasksScreen.screenId:
        return MaterialPageRoute(
          builder: (_) => const TasksScreen(),
        );
      case RecycleBin.screenId:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const TasksScreen(),
        );
    }
  }
}
