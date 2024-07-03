import 'package:flutter/material.dart';
import 'package:tasks_app_bloc/widgets/task_drawer.dart';
import 'package:tasks_app_bloc/widgets/task_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const screenId = 'recycle_bin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task App'),
        ),
        drawer: const TaskDrawer(),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(label: Text('Recycle Bin')),
            ),
            Expanded(
              child: TaskList(taskList: []),
            )
          ],
        ));
  }
}
