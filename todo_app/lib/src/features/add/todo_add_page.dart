import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/const/color_schemes.g.dart';
import 'package:todo_app/src/features/bloc/todo_bloc.dart';
import 'package:todo_app/src/models/task_model.dart';

class TodoAddPage extends StatelessWidget {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  TodoAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ADD TODO",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 20),
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(
                    Icons.clear,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Enter a title";
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _descriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(
                    Icons.clear,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Enter a description!";
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 70,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<TodoBloc>().add(
                            TodoSave(
                              TaskModel(
                                title: _titleController.text,
                                description: _descriptionController.text,
                                uuid: Random().nextInt(999999).toString(),
                                isCompleted: false,
                                dateTime: DateTime.now(),
                              ),
                            ),
                          );
                      Navigator.pop(context);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => states.contains(MaterialState.pressed)
                          ? lightColorScheme.secondary
                          : lightColorScheme.primary,
                    ),
                  ),
                  child: const Text(
                    "ADD",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
