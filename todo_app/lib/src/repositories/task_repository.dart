import 'package:todo_app/src/models/task_model.dart';

abstract class ITaskRepository {
  List<TaskModel> findAll();

  save(TaskModel task);

  delete(TaskModel task);

  update(TaskModel task);

  toggleCheck(TaskModel task);
}

class TaskRepository implements ITaskRepository {
  final List<TaskModel> tasks = <TaskModel>[];

  @override
  List<TaskModel> findAll() {
    return tasks;
  }

  @override
  save(TaskModel task) {
    if (!tasks.contains(task)) {
      tasks.add(task);
    }
  }

  @override
  delete(TaskModel task) {
    if (tasks.contains(task)) {
      tasks.remove(task);
    }
  }

  @override
  update(TaskModel task) {
    for (var element in tasks) {
      if (element.uuid == task.uuid) {
        tasks[tasks.indexOf(element)] = task;
      }
    }
  }

  @override
  toggleCheck(TaskModel task) {
    if (tasks.contains(task)) {
      for (var element in tasks) {
        if (element == task) {
          element.isCompleted = !element.isCompleted;
        }
      }
    }
  }
}
