import 'package:flutter/material.dart';
import 'package:tasks_app_bloc/blocs/task_bloc/task_bloc.dart';
import 'package:tasks_app_bloc/screens/add_task_screen.dart';
import 'package:tasks_app_bloc/screens/completed_task_screen.dart';
import 'package:tasks_app_bloc/screens/favourite_task_screen.dart';
import 'package:tasks_app_bloc/screens/pending_tasks_screen.dart';
import 'package:tasks_app_bloc/widgets/task_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);
  static const screenId = 'tab_screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, dynamic>> _pageDetails = const [
    {'page_name': 'Pending Task', 'screen': PendingTaskScreen()},
    {'page_name': 'Completed Task', 'screen': CompletedTaskScreen()},
    {'page_name': 'Favourite Task', 'screen': FavouriteTaskScreen()}
  ];
  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(_pageDetails[_currentScreen]['page_name']),
            actions:
                ((_pageDetails[_currentScreen]['page_name']) == 'Pending Task')
                    ? [
                        IconButton(
                          onPressed: () => _addTask(context),
                          icon: Icon(
                            Icons.add,
                            color: theme.colorScheme.background,
                          ),
                        )
                      ]
                    : null,
          ),
          drawer: TaskDrawer(
            pendingTaskLength: state.pendingTasks.length.toString(),
            removedTaskList: state.removedTasks.length.toString(),
          ),
          body: _pageDetails[_currentScreen]['screen'],
          floatingActionButton:
              ((_pageDetails[_currentScreen]['page_name']) == 'Pending Task')
                  ? FloatingActionButton(
                      onPressed: () => _addTask(context),
                      tooltip: 'Add Task',
                      child: const Icon(Icons.add),
                    )
                  : null,
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentScreen,
              onTap: (newScreen) {
                setState(() {
                  _currentScreen = newScreen;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.incomplete_circle), label: 'Pending Task'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.done_outline_sharp),
                    label: 'Completed Task'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outline_rounded),
                    label: 'Favourite Task')
              ]),
        );
      },
    );
  }

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const AddTaskScreen();
        });
  }
}
