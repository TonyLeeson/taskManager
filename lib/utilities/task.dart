import 'package:flutter/material.dart';

class Task {
  bool taskCompleted = false;
  String taskText = 'Test';
  DateTime taskDueDate = DateTime.now();
  TimeOfDay taskDueTime = TimeOfDay.now();

  Task(
      {required String taskText,
      required DateTime taskDueDate,
      required TimeOfDay taskDueTime});

  String description() {
    return taskText;
  }
}
