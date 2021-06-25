import 'package:flutter/material.dart';
import 'package:task_manager/utilities/task.dart';

class TasksScreen extends StatelessWidget {
  // const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Task task = Task(
      taskText: 'This is a test task',
      taskDueDate: DateTime.now(),
      taskDueTime: TimeOfDay.now(),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text('List of tasks will go here.'),
            Card(
              color: Colors.blue,
              child: ListTile(
                subtitle: Text(
                  task.description(),
                ),
                title: Text(
                  'This is the Title text',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
