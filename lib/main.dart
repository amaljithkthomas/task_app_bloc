import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks_app_bloc/blocs/switch_bloc/switch_cubit.dart';
import 'package:tasks_app_bloc/blocs/task_bloc/task_bloc.dart';

import 'package:tasks_app_bloc/screens/tasks_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_bloc/services/app-route.dart';
import 'package:tasks_app_bloc/services/app_theme.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskBloc()),
        BlocProvider(create: (context) => SwitchCubit()),
      ],
      child: BlocBuilder<SwitchCubit, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Tasks App',
            theme: state.switchState
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            /*ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              appBarTheme: AppBarTheme(
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),*/
            onGenerateRoute: appRoute.onRouteGenerate,
            home: const TasksScreen(),
          );
        },
      ),
    );
  }
}
