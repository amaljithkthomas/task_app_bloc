import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_bloc/blocs/task_bloc/task_bloc.dart';
import 'package:tasks_app_bloc/models/task.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app_bloc/screens/edit_task_screen.dart';
import 'package:tasks_app_bloc/widgets/popup_menu.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              task.isFavourite == true
                  ? const Icon(
                      Icons.star,
                      color: Colors.amber,
                    )
                  : const Icon(
                      Icons.star_outline,
                    ),
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
          favFunction: () =>
              context.read<TaskBloc>().add(MarkFavouriteTaskEvent(task: task)),
          editFunction: () => _editTask(context),
          restoreFunction: () =>
              context.read<TaskBloc>().add(RestoreTaskEvent(task: task)),
        )
      ],
    );
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return EditTaskScreen(oldTask: task);
        });
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
