import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/features/bloc/todo_bloc.dart';
import 'package:todo_app/src/models/task_model.dart';
import 'package:todo_app/src/repositories/task_repository.dart';

import 'const/color_schemes.g.dart';
import 'features/home/todo_home_page.dart';

class AppMaterial extends StatelessWidget {
  const AppMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(repository: TaskRepository())
        ..add(
          TodoSave(
            TaskModel(
              uuid: "21312",
              title: "TODO TITLE",
              description: "TODO DESCRIPTION",
              dateTime: DateTime.now(),
              isCompleted: false,
            ),
          ),
        ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: lightColorScheme.primary, iconSize: 34),
          appBarTheme: AppBarTheme(
            color: lightColorScheme.primary,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
