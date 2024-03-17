import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/const/color_schemes.g.dart';
import 'package:todo_app/src/features/bloc/todo_bloc.dart';
import 'package:todo_app/src/features/edit/todo_edit_page.dart';
import 'package:todo_app/src/models/task_model.dart';

class TodoCustomBar extends StatelessWidget {
  final TaskModel task;

  const TodoCustomBar({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 7, right: 7, top: 10),
      width: double.maxFinite,
      height: 86,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 2,
              offset: const Offset(2, 3),
              spreadRadius: 2),
        ],
      ),
      alignment: Alignment.center,
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
              color: lightColorScheme.primary,
              fontSize: 21,
              fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          task.description,
          style: TextStyle(
            color: lightColorScheme.onPrimaryContainer,
            fontSize: 13,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoEditPage(task: task),
                  ),
                );
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                context.read<TodoBloc>().add(TodoDelete(task));
              },
              icon: const Icon(Icons.delete_outline),
            ),
            IconButton(
              onPressed: () {
                context.read<TodoBloc>().add(TodoToggleCheck(task));
              },
              icon: task.isCompleted
                  ? const Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                    )
                  : const Icon(Icons.check_circle_outline),
            ),
          ],
        ),
      ),
    );
  }
}
