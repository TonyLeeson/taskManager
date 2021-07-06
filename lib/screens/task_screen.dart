import 'package:flutter/material.dart';
import 'package:task_manager/db/tasks_database.dart';
import 'package:task_manager/screens/task_entry_screen.dart';
import 'package:task_manager/utilities/task.dart';
import 'package:task_manager/utilities/tasks.dart';
import 'package:task_manager/widgets/task_card.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TasksScreen extends StatefulWidget {
  // const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  bool tasksSorted = true;
  late List<Task> listOfTasks;

  @override
  void initState() {
    super.initState();
    // refreshTasks();
  }

  @override
  void dispose() {
    TasksDatabase.instance.close();
    super.dispose();
  }

  refreshTasks() async {
    this.listOfTasks = await TasksDatabase.instance.readAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    if (tasksSorted) {
      tasks
          .sort((a, b) => a.taskDueDateAndTime.compareTo(b.taskDueDateAndTime));
    }
    refreshTasks();
    print('Tasks length = ${listOfTasks.length}');

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

        child: Container(
          height: MediaQuery.of(context).size.height * .7,
          width: double.infinity,
          child: ListView.builder(
            itemCount: listOfTasks.length,
            itemBuilder: (BuildContext context, int index) {
              return TaskCard(
                cardTaskDescription: listOfTasks[index].description(),
                cardDateAndTimeString: listOfTasks[index].dueDateAndTime(),
                cardStatusColor: listOfTasks[index].statusColor(),
                isCompleted: listOfTasks[index].isCompleted,
                completeOnPress: () {
                  setState(() {
                    listOfTasks[index].isCompleted
                        ? listOfTasks[index].isCompleted = false
                        : listOfTasks[index].isCompleted = true;
                  });
                },
                deleteOnPress: () {
                  setState(() {
                    listOfTasks.removeAt(index);
                  });
                },
              );
            },
          ),
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
        // tasks.add(returnedTask);
        TasksDatabase.instance.create(returnedTask);
        refreshTasks();
        // print('This is a test print.');
        // print(TasksDatabase.instance.readAllTasks().toString());
      });
    } else {
      print('returned task was null');
    }
  }
}
