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
    on<EditTaskEvent>(_onEditTaskEvent);
    on<RestoreTaskEvent>(_onRestoreTask);
    on<DeleteAllTask>(_onDeleteAllTasks);
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
    List<Task> favouriteTaskList = state.favouriteTasks;

    // task.isDone == false
    //     ? {
    //         pendingTaskList = List<Task>.from(pendingTaskList)..remove(task),
    //         completedTaskList = List<Task>.from(completedTaskList)
    //           ..insert(0, task.copyWith(isDone: true)),
    //       }
    //     : {
    //         pendingTaskList = List<Task>.from(pendingTaskList)
    //           ..insert(0, task.copyWith(isDone: false)),
    //         completedTaskList = List<Task>.from(completedTaskList)
    //           ..remove(task),
    //       };
    if (task.isDone == false) {
      if (task.isFavourite == false) {
        pendingTaskList = List.from(pendingTaskList)..remove(task);
        completedTaskList = List.from(completedTaskList)
          ..insert(
            0,
            task.copyWith(isDone: true),
          );
      } else {
        var taskIndex = favouriteTaskList.indexOf(task);
        pendingTaskList = List.from(pendingTaskList)..remove(task);
        completedTaskList = List.from(completedTaskList)
          ..insert(
            0,
            task.copyWith(
              isDone: true,
              isFavourite: true,
            ),
          );
        favouriteTaskList = List.from(favouriteTaskList)
          ..remove(task)
          ..insert(
            taskIndex,
            task.copyWith(
              isDone: true,
              isFavourite: true,
            ),
          );
      }
    } else {
      if (task.isFavourite == false) {
        completedTaskList = List.from(completedTaskList)..remove(task);
        pendingTaskList = List.from(pendingTaskList)
          ..insert(0, task.copyWith(isDone: false));
      } else {
        var taskIndex = favouriteTaskList.indexOf(task);
        completedTaskList = List.from(pendingTaskList)..remove(task);
        pendingTaskList = List.from(pendingTaskList)
          ..insert(
            0,
            task.copyWith(
              isDone: false,
              isFavourite: true,
            ),
          );

        favouriteTaskList = List.from(favouriteTaskList)
          ..remove(task)
          ..insert(
            taskIndex,
            task.copyWith(isDone: false),
          );
      }
    }
    emit(TaskState(
      pendingTasks: pendingTaskList,
      removedTasks: state.removedTasks,
      completedTasks: completedTaskList,
      favouriteTasks: favouriteTaskList,
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
    final task = event.task;
    List<Task> pendingTaskList = state.pendingTasks;
    List<Task> removedTaskList = state.removedTasks;
    List<Task> completedTaskList = state.completedTasks;
    List<Task> favouriteTaskList = state.favouriteTasks;
    if (task.isDone == false) {
      if (task.isFavourite == false) {
        var taskIndex = pendingTaskList.indexOf(task);
        pendingTaskList = List.from(pendingTaskList)
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isFavourite: true));
        favouriteTaskList = List.from(favouriteTaskList)
          ..insert(
            0,
            task.copyWith(isFavourite: true),
          );
      } else {
        var taskIndex = pendingTaskList.indexOf(task);
        pendingTaskList = List.from(pendingTaskList)
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isFavourite: false));
        favouriteTaskList = List.from(favouriteTaskList)..remove(task);
      }
    } else {
      if (task.isFavourite == false) {
        var taskIndex = completedTaskList.indexOf(task);
        completedTaskList = List.from(completedTaskList)
          ..remove(task)
          ..insert(
            taskIndex,
            task.copyWith(isFavourite: true),
          );
        favouriteTaskList = List.from(favouriteTaskList)
          ..insert(
            0,
            task.copyWith(isFavourite: true),
          );
      } else {
        var taskIndex = completedTaskList.indexOf(task);
        completedTaskList = List.from(pendingTaskList)
          ..remove(task)
          ..insert(
            taskIndex,
            task.copyWith(isFavourite: false),
          );
        favouriteTaskList = List.from(favouriteTaskList)..remove(task);
      }
    }
    emit(TaskState(
        pendingTasks: pendingTaskList,
        completedTasks: completedTaskList,
        removedTasks: removedTaskList,
        favouriteTasks: favouriteTaskList));
  }

  void _onEditTaskEvent(EditTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    List<Task> favouriteTaskList = state.favouriteTasks;
    if (event.oldTask.isFavourite == true) {
      favouriteTaskList = List.from(favouriteTaskList)
        ..remove(event.oldTask)
        ..insert(0, event.newTask);
    }
    emit(TaskState(
      pendingTasks: List.from(state.pendingTasks)
        ..remove(event.oldTask)
        ..insert(0, event.newTask),
      favouriteTasks: favouriteTaskList,
      completedTasks: List.from(state.completedTasks)..remove(event.oldTask),
      removedTasks: state.removedTasks,
    ));
  }

  void _onRestoreTask(RestoreTaskEvent event, Emitter<TaskState> emit) {
    emit(TaskState(
      removedTasks: List.from(state.removedTasks)..remove(event.task),
      pendingTasks: List.from(state.pendingTasks)
        ..insert(
            0,
            event.task.copyWith(
              isFavourite: false,
              isDone: false,
              isDeleted: false,
            )),
      completedTasks: state.completedTasks,
      favouriteTasks: state.favouriteTasks,
    ));
  }

  void _onDeleteAllTasks(DeleteAllTask event, Emitter<TaskState> emit) {
    emit(TaskState(
      removedTasks: List.from(state.removedTasks)..clear(),
      pendingTasks: state.pendingTasks,
      completedTasks: state.completedTasks,
      favouriteTasks: state.favouriteTasks,
    ));
  }
}
