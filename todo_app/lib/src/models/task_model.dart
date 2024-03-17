class TaskModel {
  final String uuid;
  final String title;
  final String description;
  bool isCompleted;
  final DateTime dateTime;

  TaskModel(
      {required this.isCompleted,
      required this.dateTime,
      required this.uuid,
      required this.title,
      required this.description});

  factory TaskModel.empty() {
    return TaskModel(
        title: "",
        description: "",
        uuid: '',
        isCompleted: false,
        dateTime: DateTime.now());
  }

  TaskModel copyWith(String? title, String? description, String? uuid,
      bool? isCompleted, DateTime? dateTime) {
    return TaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      uuid: uuid ?? this.uuid,
      isCompleted: isCompleted ?? this.isCompleted,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
