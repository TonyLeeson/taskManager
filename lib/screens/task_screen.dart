import 'package:flutter/material.dart';
import 'package:task_manager/utilities/task.dart';

class TasksScreen extends StatelessWidget {
  // const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Task> task = [
      Task(
        taskText: 'This is the first test task',
        taskDueDateAndTime: DateTime(2021, 6, 24, 10, 15),
        taskCompleted: false,
      ),
      Task(
        taskText: 'This is the second test task',
        taskDueDateAndTime: DateTime(2021, 6, 25, 22, 26),
        taskCompleted: true,
      ),
      Task(
        taskText: 'This is the third test task',
        taskDueDateAndTime: DateTime(2021, 6, 25, 23, 59),
        taskCompleted: false,
      ),
      Task(
        taskText: 'This is the forth test task',
        taskDueDateAndTime: DateTime(2021, 9, 12, 9, 30),
        taskCompleted: false,
      ),
      Task(
        taskText: 'This is the fifth test task',
        taskDueDateAndTime: DateTime(2021, 9, 12, 9, 30),
        taskCompleted: false,
      ),
      Task(
        taskText: 'This is the sixth test task',
        taskDueDateAndTime: DateTime(2021, 9, 12, 9, 30),
        taskCompleted: false,
      ),
      Task(
        taskText: 'This is the seventh test task',
        taskDueDateAndTime: DateTime(2021, 9, 12, 9, 30),
        taskCompleted: false,
      ),
      Task(
        taskText: 'This is the eight test task',
        taskDueDateAndTime: DateTime(2021, 9, 12, 9, 30),
        taskCompleted: false,
      ),
      Task(
        taskText: 'This is the ninth test task',
        taskDueDateAndTime: DateTime(2021, 9, 12, 9, 30),
        taskCompleted: false,
      ),
      Task(
        taskText: 'This is the tenth test task',
        taskDueDateAndTime: DateTime(2021, 9, 12, 9, 30),
        taskCompleted: true,
      ),
      Task(
        taskText: 'This is the eleventh test task',
        taskDueDateAndTime: DateTime(2021, 9, 12, 9, 30),
        taskCompleted: false,
      ),
      Task(
        taskText: 'This is the twelfth test task',
        taskDueDateAndTime: DateTime(2021, 9, 12, 9, 30),
        taskCompleted: false,
      ),
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('new task added');
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: task.length,
          itemBuilder: (BuildContext context, int index) {
            return TaskCard(
              cardTaskDescription: task[index].description(),
              cardDateAndTimeString: task[index].dueDateAndTime(),
              cardStatusColor: task[index].statusColor(),
            );
          },
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  TaskCard(
      {required this.cardTaskDescription,
      required this.cardDateAndTimeString,
      required this.cardStatusColor});

  Color cardStatusColor;
  String cardDateAndTimeString;
  String cardTaskDescription;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardStatusColor,
      child: ListTile(
        subtitle: Text(
          cardDateAndTimeString,
        ),
        title: Text(
          cardTaskDescription,
        ),
      ),
    );
  }
}
