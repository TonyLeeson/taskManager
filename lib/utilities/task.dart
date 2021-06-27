import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task {
  bool isCompleted;
  String taskText;
  DateTime taskDueDateAndTime;

  Task(
      {required this.taskText,
      required this.taskDueDateAndTime,
      required this.isCompleted});

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
