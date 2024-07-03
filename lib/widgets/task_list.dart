import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_bloc/bloc/bloc/task_bloc.dart';
import 'package:tasks_app_bloc/models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          var task = taskList[index];
          return ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                decoration: task.isDone! ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Checkbox(
              value: task.isDone,
              onChanged: (value) {
                context.read<TaskBloc>().add(UpdateTaskEvent(task: task));
              },
            ),
            onLongPress: () =>
                context.read<TaskBloc>().add(DeleteTaskEvent(task: task)),
          );
        });
  }
}
