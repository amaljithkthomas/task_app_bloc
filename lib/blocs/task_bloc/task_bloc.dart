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
    on<RemoveTaskEvent>(_onRemoveTask);
    on<MarkFavouriteTaskEvent>(_markFavouriteTaskEvent);
  }

  void _onAddTaskEvent(AddTaskEvent event, Emitter<TaskState> emit) {
    final pendingTaskList = List<Task>.from(state.pendingTasks)
      ..add(event.task);

    emit(TaskState(
      pendingTasks: pendingTaskList,
      removedTasks: state.removedTasks,
      completedTasks: state.completedTasks,
      favouriteTasks: state.favouriteTasks,
    ));
  }

  void _onUpdateTaskEvent(UpdateTaskEvent event, Emitter<TaskState> emit) {
    final task = event.task;
    // final index = state.pendingTasks.indexOf(task);
    List<Task> pendingTaskList = state.pendingTasks;
    List<Task> completedTaskList = state.completedTasks;

    task.isDone == false
        ? {
            pendingTaskList = List<Task>.from(pendingTaskList)..remove(task),
            completedTaskList = List<Task>.from(completedTaskList)
              ..insert(0, task.copyWith(isDone: true)),
          }
        : {
            completedTaskList = List<Task>.from(completedTaskList)
              ..remove(task),
            pendingTaskList = List<Task>.from(pendingTaskList)
              ..insert(0, task.copyWith(isDone: false)),
          };
    emit(TaskState(
      pendingTasks: pendingTaskList,
      removedTasks: state.removedTasks,
      completedTasks: completedTaskList,
      favouriteTasks: state.favouriteTasks,
    ));
  }

  void _onDeleteTask(DeleteTaskEvent event, Emitter<TaskState> emit) {
    final task = event.task;
    List<Task> pendingTaskList = List.from(state.pendingTasks)..remove(task);
    List<Task> removedTaskList = List.from(state.removedTasks)
      ..add(task.copyWith(isDeleted: true));
    List<Task> completedTaskList = List.from(state.completedTasks)
      ..remove(task);
    List<Task> favouriteTaskList = List.from(state.favouriteTasks)
      ..remove(task);
    emit(TaskState(
      pendingTasks: pendingTaskList,
      removedTasks: removedTaskList,
      completedTasks: completedTaskList,
      favouriteTasks: favouriteTaskList,
    ));
  }

  void _onRemoveTask(RemoveTaskEvent event, Emitter<TaskState> emit) {
    List<Task> removedTaskList = List.from(state.removedTasks)
      ..remove(event.task);
    emit(TaskState(
      pendingTasks: state.pendingTasks,
      removedTasks: removedTaskList,
      completedTasks: state.completedTasks,
      favouriteTasks: state.favouriteTasks,
    ));
  }

  void _markFavouriteTaskEvent(
      MarkFavouriteTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    final pendingTaskList = state.pendingTasks;
    final removedTaskList = state.removedTasks;
    final completedTaskList = state.completedTasks;
  }
}
