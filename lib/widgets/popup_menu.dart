import 'package:flutter/material.dart';
import 'package:tasks_app_bloc/blocs/task_bloc/task_bloc.dart';
import 'package:tasks_app_bloc/models/task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    super.key,
    required this.task,
    this.deleteFunction,
  });

  final Task task;
  final void Function()? deleteFunction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopupMenuButton(
      itemBuilder: (context) => task.isDeleted == true
          ? [
              PopupMenuItem(
                onTap: () {},
                child: const Row(
                  children: [
                    Icon(Icons.restore_from_trash),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Restore',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: deleteFunction,
                child: const Row(
                  children: [
                    Icon(Icons.delete_forever),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Delete forever',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ]
          : [
              PopupMenuItem(
                onTap: () {},
                child: const Row(
                  children: [
                    Icon(Icons.edit),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () {},
                child: const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Add to favourite',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: deleteFunction,
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: theme.colorScheme.error,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'Delete',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
    );
  }
}
