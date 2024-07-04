import 'package:flutter/material.dart';
import 'package:tasks_app_bloc/screens/recycle_bin.dart';
import 'package:tasks_app_bloc/screens/tasks_screen.dart';

class TaskDrawer extends StatelessWidget {
  const TaskDrawer({
    Key? key,
    this.taskLength,
    this.removedTaskList,
  }) : super(key: key);
  final String? taskLength;
  final String? removedTaskList;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),
              color: theme.colorScheme.primary,
              child: Text(
                'Task Drawer',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.background,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                TasksScreen.screenId,
              ),
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text('Tasks'),
                  trailing: Text(taskLength ?? '0'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                RecycleBin.screenId,
              ),
              child: Card(
                child: ListTile(
                  leading: Icon(
                    Icons.delete,
                    color: theme.colorScheme.error,
                  ),
                  title: const Text('Bin'),
                  trailing: Text(removedTaskList ?? '0'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
