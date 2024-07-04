part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> removedTasks;
  final List<Task> completedTasks;
  final List<Task> favouriteTasks;

  const TaskState({
    this.pendingTasks = const <Task>[],
    this.removedTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.favouriteTasks = const <Task>[],
  });
  @override
  List<Object> get props => [
        pendingTasks,
        removedTasks,
        completedTasks,
        favouriteTasks,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
      'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
      'favouriteTasks': favouriteTasks.map((x) => x.toMap()).toList(),
    };
  }
// fixed the hydrated bloc issue by replacing this factory method
  /*factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      allTasks: List<Task>.from(
        (map['allTasks'] as List<Task>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );*/

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      pendingTasks:
          List<Task>.from(map['pendingTasks'].map((x) => Task.fromMap(x))),
      removedTasks:
          List<Task>.from(map['removedTasks'].map((x) => Task.fromMap(x))),
      completedTasks:
          List<Task>.from(map['completedTasks'].map((x) => Task.fromMap(x))),
      favouriteTasks:
          List<Task>.from(map['favouriteTasks'].map((x) => Task.fromMap(x))),
    );
  }
}
