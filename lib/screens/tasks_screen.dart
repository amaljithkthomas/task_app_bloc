import 'package:flutter/material.dart';
import 'package:tasks_app_bloc/bloc/bloc/task_bloc.dart';
import 'package:tasks_app_bloc/screens/add_task_screen.dart';
import 'package:tasks_app_bloc/widgets/task_drawer.dart';

import 'package:tasks_app_bloc/widgets/task_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});
  static const screenId = 'tasks_screen';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Task App'),
            actions: [
              IconButton(
                onPressed: () => _addTask(context),
                icon: Icon(
                  Icons.add,
                  color: theme.colorScheme.background,
                ),
              )
            ],
          ),
          drawer: TaskDrawer(
            taskLength: state.allTasks.length.toString(),
            removedTaskList: state.removedTasks.length.toString(),
          ),
          body: Builder(builder: (context) {
            if (state.allTasks.isEmpty) {
              return const Center(
                child: Chip(label: Text('No Tasks available')),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Chip(label: Text('${state.allTasks.length} Tasks')),
                ),
                Expanded(
                  child: TaskList(taskList: state.allTasks),
                )
              ],
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
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
