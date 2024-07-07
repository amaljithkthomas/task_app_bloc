import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_bloc/blocs/task_bloc/task_bloc.dart';
import 'package:tasks_app_bloc/models/task.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({
    super.key,
    required this.oldTask,
  });
  final Task oldTask;

  @override
  State<EditTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.oldTask.title);
    _descController = TextEditingController(text: widget.oldTask.description);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Edit Task',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  autofocus: false,
                  controller: _titleController,
                  decoration: const InputDecoration(
                      label: Text('Title'), border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  autofocus: false,
                  controller: _descController,
                  minLines: 3,
                  maxLines: 5,
                  decoration: const InputDecoration(
                      label: Text('Description'), border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final editedTask = Task(
                          title: _titleController.text.trim(),
                          id: widget.oldTask.id,
                          description: _descController.text.trim(),
                          isDone: false,
                          isFavourite: widget.oldTask.isFavourite,
                          date: DateTime.now().toIso8601String(),
                        );
                        context.read<TaskBloc>().add(EditTaskEvent(
                              oldTask: widget.oldTask,
                              newTask: editedTask,
                            ));
                        Navigator.pop(context);
                      },
                      child: const Text('Save'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
