


import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tasks_app_bloc/models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }

  TaskBloc() : super(const TaskState()) {
    on<AddTaskEvent>(_onAddTaskEvent);

    on<UpdateTaskEvent>(_onUpdateTaskEvent);

    on<DeleteTaskEvent>(_onDeleteTask);
  }

  void _onAddTaskEvent(AddTaskEvent event, Emitter<TaskState> emit) {
    final allList = List<Task>.from(state.allTasks)..add(event.task);

    emit(TaskState(allTasks: allList));
  }

  void _onUpdateTaskEvent(UpdateTaskEvent event, Emitter<TaskState> emit) {
    final task = event.task;
    final index = state.allTasks.indexOf(task);
    List<Task> allList = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allList.insert(index, task.copyWith(isDone: true))
        : allList.insert(index, task.copyWith(isDone: false));
    emit(TaskState(allTasks: allList));
  }

  void _onDeleteTask(DeleteTaskEvent event, Emitter<TaskState> emit) {
    List<Task> allList = List.from(state.allTasks)..remove(event.task);
    emit(TaskState(allTasks: allList));
  }
}
