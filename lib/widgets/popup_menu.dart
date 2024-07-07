import 'package:flutter/material.dart';

import 'package:tasks_app_bloc/models/task.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu(
      {super.key,
      required this.task,
      this.deleteFunction,
      this.favFunction,
      this.editFunction,
      this.restoreFunction});

  final Task task;
  final void Function()? deleteFunction;
  final void Function()? favFunction;
  final void Function()? editFunction;
  final void Function()? restoreFunction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopupMenuButton(
      itemBuilder: (context) => task.isDeleted == true
          ? [
              PopupMenuItem(
                onTap: restoreFunction,
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
                onTap: editFunction,
                child: const Row(children: [
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
                ]),
              ),
              PopupMenuItem(
                onTap: favFunction,
                child: Row(
                  children: [
                    task.isFavourite == false
                        ? const Icon(
                            Icons.star,
                            color: Colors.amber,
                          )
                        : const Icon(
                            Icons.star_outline,
                          ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      task.isFavourite == false
                          ? 'Add to favourite'
                          : 'Remove from favourite',
                      style: const TextStyle(
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
