import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/src/core/async_bloc_states.dart';
import 'package:todo_app/src/models/task_model.dart';
import 'package:todo_app/src/repositories/task_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final ITaskRepository repository;

  TodoBloc({required this.repository}) : super(const TodoState()) {
    on<TodoEvent>((event, Emitter emit) async {
      switch (event) {
        case TodoSave():
          emit(state.copyWith(AsyncStatus.isLoading, []));
          await Future.delayed(const Duration(milliseconds: 500));
          repository.save(event.task);
          emit(state.copyWith(AsyncStatus.isLoad, repository.findAll()));
        case TodoDelete():
          emit(state.copyWith(AsyncStatus.isLoading, []));
          repository.delete(event.task);
          await Future.delayed(const Duration(milliseconds: 500));
          emit(state.copyWith(AsyncStatus.isLoad, repository.findAll()));
        case TodoToggleCheck():
          emit(state.copyWith(AsyncStatus.isLoading, []));
          repository.toggleCheck(event.task);
          emit(state.copyWith(AsyncStatus.isLoad, repository.findAll()));
        case TodoUpdate():
          emit(state.copyWith(AsyncStatus.isLoading, []));
          repository.update(event.task);
          emit(state.copyWith(AsyncStatus.isLoad, repository.findAll()));
      }
    });
  }
}
