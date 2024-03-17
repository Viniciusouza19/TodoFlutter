import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/components/todo_bar.dart';

import '../bloc/todo_bloc.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.tasks.length,
          itemBuilder: (context, index) => state.tasks[index].isCompleted
              ? TodoCustomBar(task: state.tasks[index])
              : Container(),
        );
      },
    );
  }
}
