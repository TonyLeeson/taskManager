import 'package:flutter/material.dart';
import 'package:task_manager/utilities/task.dart';
import 'package:task_manager/utilities/tasks.dart';

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
          print('new task added');
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return TaskCard(
              cardTaskDescription: tasks[index].description(),
              cardDateAndTimeString: tasks[index].dueDateAndTime(),
              cardStatusColor: tasks[index].statusColor(),
              isCompleted: tasks[index].isCompleted,
              completeOnPress: () {
                print('Complete with index $index pressed');
                setState(() {
                  tasks[index].isCompleted
                      ? tasks[index].isCompleted = false
                      : tasks[index].isCompleted = true;
                });
              },
              deleteOnPress: () {
                print('Delete with index $index pressed');
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
}

class TaskCard extends StatelessWidget {
  TaskCard(
      {required this.cardTaskDescription,
      required this.cardDateAndTimeString,
      required this.cardStatusColor,
      required this.isCompleted,
      required this.completeOnPress,
      required this.deleteOnPress});

  final Color cardStatusColor;
  final String cardDateAndTimeString;
  final String cardTaskDescription;
  final bool isCompleted;
  final void Function() completeOnPress;
  final void Function() deleteOnPress;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardStatusColor,
      child: ListTile(
        leading: IconButton(
          icon: Icon(Icons.delete),
          onPressed: deleteOnPress,
        ),
        trailing: IconButton(
          icon: Icon(isCompleted ? Icons.check : Icons.check_box_outline_blank),
          onPressed: completeOnPress,
        ),
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
