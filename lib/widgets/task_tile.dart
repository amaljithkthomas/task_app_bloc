import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_bloc/blocs/task_bloc/task_bloc.dart';
import 'package:tasks_app_bloc/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          decoration: task.isDone! ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: task.isDeleted!
            ? null
            : (value) {
                context.read<TaskBloc>().add(UpdateTaskEvent(task: task));
              },
      ),
      onLongPress: () => task.isDeleted!
          ? context.read<TaskBloc>().add(RemoveTaskEvent(task: task))
          : context.read<TaskBloc>().add(DeleteTaskEvent(task: task)),
    );
  }
}
