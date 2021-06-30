import 'package:flutter/material.dart';
import 'package:task_manager/screens/task_entry_screen.dart';
import 'package:task_manager/utilities/task.dart';
import 'package:task_manager/utilities/tasks.dart';
import 'package:task_manager/widgets/task_card.dart';

class TasksScreen extends StatefulWidget {
  // const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  bool tasksSorted = true;

  @override
  Widget build(BuildContext context) {
    if (tasksSorted) {
      tasks
          .sort((a, b) => a.taskDueDateAndTime.compareTo(b.taskDueDateAndTime));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateAndLoadNewTask(context);
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        // minimum: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return TaskCard(
              cardTaskDescription: tasks[index].description(),
              cardDateAndTimeString: tasks[index].dueDateAndTime(),
              cardStatusColor: tasks[index].statusColor(),
              isCompleted: tasks[index].isCompleted,
              completeOnPress: () {
                setState(() {
                  tasks[index].isCompleted
                      ? tasks[index].isCompleted = false
                      : tasks[index].isCompleted = true;
                });
              },
              deleteOnPress: () {
                setState(() {
                  tasks.removeAt(index);
                });
              },
            );
          },
        ),
      ),
    );
  }

  // A method that launches the task_entry screen and appends the returned
  // task to the tasks List.
  void _navigateAndLoadNewTask(BuildContext context) async {
    final Task? returnedTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => taskEntryScreen()),
    );
    if (returnedTask != null) {
      print('Returned task was not null');
      setState(() {
        tasks.add(returnedTask);
      });
    } else {
      print('returned task was null');
    }
  }
}
