part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  const AddTaskEvent({
    required this.task,
  });
  final Task task;
  @override
  List<Object> get props => [task];
}

class UpdateTaskEvent extends TaskEvent {
  const UpdateTaskEvent({
    required this.task,
  });
  final Task task;
  @override
  List<Object> get props => [task];
}

class DeleteTaskEvent extends TaskEvent {
  const DeleteTaskEvent({
    required this.task,
  });
  final Task task;
  @override
  List<Object> get props => [task];
}

class RemoveTaskEvent extends TaskEvent {
  const RemoveTaskEvent({
    required this.task,
  });
  final Task task;
  @override
  List<Object> get props => [task];
}
