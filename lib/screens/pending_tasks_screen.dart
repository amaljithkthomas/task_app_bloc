import 'package:flutter/material.dart';
import 'package:tasks_app_bloc/blocs/task_bloc/task_bloc.dart';
import 'package:tasks_app_bloc/widgets/task_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PendingTaskScreen extends StatelessWidget {
  const PendingTaskScreen({super.key});
  static const screenId = 'pending_tasks_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state.pendingTasks.isEmpty) {
          return const Center(
            child: Chip(label: Text('No Tasks available')),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                  label: Text(
                      '${state.pendingTasks.length} Pending | ${state.completedTasks.length} Completed ')),
            ),
            TaskList(taskList: state.pendingTasks)
          ],
        );
      },
    );
  }
}
