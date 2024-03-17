part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();
}

class TodoSave implements TodoEvent {
  final TaskModel task;

  TodoSave(this.task);

  List<TaskModel> get tasks => this.tasks;

  @override
  List<Object?> get props => [task];

  @override
  bool? get stringify => throw UnimplementedError();
}

class TodoDelete implements TodoEvent {
  final TaskModel task;

  TodoDelete(this.task);

  @override
  List<Object?> get props => [task];

  @override
  bool? get stringify => throw UnimplementedError();
}

class TodoToggleCheck implements TodoEvent {
  final TaskModel task;

  TodoToggleCheck(this.task);

  @override
  List<Object?> get props => [task];

  @override
  bool? get stringify => throw UnimplementedError();
}

class TodoUpdate implements TodoEvent {
  final TaskModel task;

  TodoUpdate(this.task);

  @override
  List<Object?> get props => [task];

  @override
  bool? get stringify => throw UnimplementedError();
}
