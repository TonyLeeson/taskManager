import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final String tableTasks = 'tasks';

class TasksFields {
  static final List<String> values = [
    id,
    isComplete,
    taskText,
    taskDueDateAndTime
  ];
  static final String id = '_id';
  static final String isComplete = 'isComplete';
  static final String taskText = 'taskText';
  static final String taskDueDateAndTime = 'taskDueDateAndTime';
}

class Task {
  final int? id;
  bool isCompleted;
  final String taskText;
  final DateTime taskDueDateAndTime;

  Task({
    this.id,
    required this.taskText,
    required this.taskDueDateAndTime,
    required this.isCompleted,
  });

  Task copy({
    int? id,
    bool? isCompleted,
    String? taskText,
    DateTime? taskDueDateAndTime,
  }) =>
      Task(
        id: id ?? this.id,
        taskText: taskText ?? this.taskText,
        taskDueDateAndTime: taskDueDateAndTime ?? this.taskDueDateAndTime,
        isCompleted: isCompleted ?? this.isCompleted,
      );

  static Task fromJson(Map<String, Object?> json) => Task(
        id: json[TasksFields.id] as int?,
        taskText: json[TasksFields.taskText] as String,
        taskDueDateAndTime:
            DateTime.parse(json[TasksFields.taskDueDateAndTime] as String),
        isCompleted: json[TasksFields.isComplete] == 1,
      );

  Map<String, Object?> toJson() => {
        TasksFields.id: id,
        TasksFields.taskText: taskText,
        TasksFields.taskDueDateAndTime: taskDueDateAndTime.toIso8601String(),
        TasksFields.isComplete: isCompleted ? 1 : 0,
      };

  Color statusColor() {
    // Returns a Color class with the color depending on the status of the task.
    // Overdue red, due today orange, complete green, or normal blue.

    // Check if task is complete.
    if (isCompleted) {
      return Colors.green;
      // Check if task if overdue.
    } else if (taskDueDateAndTime.difference(DateTime.now()).inMinutes < 0) {
      return Colors.red;
      // Check if task is due today.
    } else if (taskDueDateAndTime.year == DateTime.now().year &&
        taskDueDateAndTime.month == DateTime.now().month &&
        taskDueDateAndTime.day == DateTime.now().day) {
      return Colors.orange;
    } else {
      return Colors.blue;
    }
  }

  String description() {
    return taskText;
  }

  String dueDateAndTime() {
    return 'Due ${DateFormat.yMMMd().format(taskDueDateAndTime).toString()} @ ${DateFormat.Hm().format(taskDueDateAndTime).toString()}';
  }
}
