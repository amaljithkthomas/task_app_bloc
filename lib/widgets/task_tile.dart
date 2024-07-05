import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_bloc/blocs/task_bloc/task_bloc.dart';
import 'package:tasks_app_bloc/models/task.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app_bloc/widgets/popup_menu.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              const Icon(Icons.star_outline),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        decoration:
                            task.isDone! ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    Text(
                      DateFormat('dd-MM-yyyy hh:mm:ss a')
                          .format(DateTime.parse(task.date)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Checkbox(
          value: task.isDone,
          onChanged: task.isDeleted!
              ? null
              : (value) {
                  context.read<TaskBloc>().add(UpdateTaskEvent(task: task));
                },
        ),
        PopupMenu(
          task: task,
          deleteFunction: () => task.isDeleted!
              ? context.read<TaskBloc>().add(RemoveTaskEvent(task: task))
              : context.read<TaskBloc>().add(DeleteTaskEvent(task: task)),
        )
      ],
    );
  }
}

/*
ListTile(
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
);*/
