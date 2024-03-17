part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final AsyncStatus status;
  final List<TaskModel> tasks;

  const TodoState({this.status = AsyncStatus.isInitial, this.tasks = const []});

  TodoState copyWith(AsyncStatus? status, List<TaskModel>? tasks) {
    return TodoState(status: status ?? this.status, tasks: tasks ?? this.tasks);
  }

  @override
  List<Object?> get props => [status, tasks];
}
