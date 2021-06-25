import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Task {
  bool taskCompleted = false;
  String taskText = '';
  DateTime taskDueDateAndTime = DateTime.now();

  Task(
      {required this.taskText,
      required this.taskDueDateAndTime,
      required this.taskCompleted});

  //TODO: Creat a function isOverdue that will return true of false. could this return a color instead (red - overdue, orange - due today, blue - normal, green - complete)?

  Color statusColor() {
    // Check if task is complete.
    if (taskCompleted) {
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
