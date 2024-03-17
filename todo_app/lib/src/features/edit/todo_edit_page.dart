import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/const/color_schemes.g.dart';
import 'package:todo_app/src/models/task_model.dart';

import '../bloc/todo_bloc.dart';

class TodoEditPage extends StatefulWidget {
  TodoEditPage({super.key, required this.task});
  final TaskModel task;

  @override
  State<TodoEditPage> createState() => _TodoEditPageState();
}

class _TodoEditPageState extends State<TodoEditPage> {
  late final TextEditingController _titleController;

  late final TextEditingController _descriptionController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController =
        TextEditingController(text: widget.task.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EDIT TODO",
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
                  return null;
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
                  if (value == null || value.isEmpty) {
                    return "Enter a description!";
                  }
                  return null;
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
                            TodoUpdate(
                              widget.task.copyWith(
                                _titleController.text,
                                _descriptionController.text,
                                null,
                                null,
                                null,
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
