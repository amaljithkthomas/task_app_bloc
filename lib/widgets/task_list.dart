import 'package:flutter/material.dart';
import 'package:tasks_app_bloc/models/task.dart';
import 'package:tasks_app_bloc/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          dividerColor: Colors.transparent,
          children: taskList
              .map(
                (task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskTile(
                    task: task,
                  ),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SelectableText.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Text\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: task.title),
                            const TextSpan(
                              text: '\nDescription\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: task.description),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );

    /*ListView.builder(
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
        });*/
  }
}
