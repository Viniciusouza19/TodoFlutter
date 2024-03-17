import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/components/todo_bar.dart';
import 'package:todo_app/src/const/color_schemes.g.dart';
import 'package:todo_app/src/core/async_bloc_states.dart';
import 'package:todo_app/src/features/add/todo_add_page.dart';
import 'package:todo_app/src/features/bloc/todo_bloc.dart';
import 'package:todo_app/src/features/completed/todo_completed_page.dart';
import 'package:todo_app/src/models/task_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> currentIndex = ValueNotifier(0);

    return Scaffold(
      backgroundColor: lightColorScheme.secondary,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "TODO",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        actions: [
          Image.asset(
            "assets/calendar_logo.png",
          ),
        ],
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (_, __, ___) => <Widget>[
          BlocConsumer<TodoBloc, TodoState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.status.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status.isLoad) {
                final List<TaskModel> tasks = state.tasks;
                return ListView.builder(
                    itemBuilder: (context, index) => !tasks[index].isCompleted
                        ? TodoCustomBar(task: tasks[index])
                        : Container(),
                    itemCount: tasks.length);
              } else {
                return Container();
              }
            },
          ),
          const CompletedPage()
        ][currentIndex.value],
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (context, index, ___) => BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                padding: const EdgeInsets.all(20.0),
                isSelected: index == 0,
                icon: const Icon(
                  Icons.list,
                  size: 30,
                ),
                onPressed: () {
                  currentIndex.value = 0;
                },
              ),
              IconButton(
                padding: const EdgeInsets.all(20.0),
                isSelected: index == 1,
                icon: const Icon(
                  Icons.verified,
                  size: 30,
                ),
                onPressed: () {
                  currentIndex.value = 1;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape:
            ShapeBorder.lerp(const StadiumBorder(), const StadiumBorder(), 23),
        child: Icon(
          Icons.add,
          color: lightColorScheme.onSecondary,
        ),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true, builder: (_) => TodoAddPage())),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
