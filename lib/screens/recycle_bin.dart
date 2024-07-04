import 'package:flutter/material.dart';
import 'package:tasks_app_bloc/blocs/task_bloc/task_bloc.dart';

import 'package:tasks_app_bloc/widgets/task_drawer.dart';
import 'package:tasks_app_bloc/widgets/task_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const screenId = 'recycle_bin';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Task App'),
            ),
            drawer: TaskDrawer(
              taskLength: state.allTasks.length.toString(),
              removedTaskList: state.removedTasks.length.toString(),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Chip(label: Text('Recycle Bin')),
                ),
                Expanded(
                  child: TaskList(taskList: state.removedTasks),
                )
              ],
            ));
      },
    );
  }
}
