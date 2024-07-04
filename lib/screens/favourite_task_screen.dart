import 'package:flutter/material.dart';
import 'package:tasks_app_bloc/blocs/task_bloc/task_bloc.dart';
import 'package:tasks_app_bloc/widgets/task_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteTaskScreen extends StatelessWidget {
  const FavouriteTaskScreen({super.key});
  static const screenId = 'pending_tasks_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state.favouriteTasks.isEmpty) {
          return const Center(
            child: Chip(label: Text('No Tasks available')),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(label: Text('${state.favouriteTasks.length} Tasks')),
            ),
            Expanded(
              child: TaskList(taskList: state.favouriteTasks),
            )
          ],
        );
      },
    );
  }
}
