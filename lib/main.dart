import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks_app_bloc/bloc/bloc/task_bloc.dart';
import 'package:tasks_app_bloc/screens/tasks_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_bloc/services/app-route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(
    MyApp(
      appRoute: AppRoute(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appRoute,
  });

  final AppRoute appRoute;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        title: 'Tasks App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            color: Theme.of(context).colorScheme.primary,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onGenerateRoute: appRoute.onRouteGenerate,
        home: const TasksScreen(),
      ),
    );
  }
}
