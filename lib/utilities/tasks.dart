import 'package:task_manager/utilities/task.dart';

List<Task> tasks = [
  Task(
    taskText: 'This is the first test task',
    taskDueDateAndTime: DateTime(2021, 6, 24, 10, 15),
    isCompleted: false,
  ),
  Task(
    taskText: 'This is the second test task',
    taskDueDateAndTime: DateTime(2021, 6, 25, 22, 26),
    isCompleted: true,
  ),
  Task(
    taskText: 'This is the third test task',
    taskDueDateAndTime: DateTime(2021, 6, 25, 23, 59),
    isCompleted: false,
  ),
  Task(
    taskText: 'This is the forth test task',
    taskDueDateAndTime: DateTime(2021, 9, 12, 9, 30),
    isCompleted: true,
  ),
  Task(
    taskText: 'This is the fifth test task',
    taskDueDateAndTime: DateTime(2021, 6, 27, 9, 30),
    isCompleted: false,
  ),
  Task(
    taskText: 'This is the sixth test task',
    taskDueDateAndTime: DateTime(2021, 6, 27, 6, 30),
    isCompleted: false,
  ),
  Task(
    taskText: 'This is the seventh test task',
    taskDueDateAndTime: DateTime(2021, 6, 27, 11, 30),
    isCompleted: false,
  ),
  Task(
    taskText: 'This is the eight test task',
    taskDueDateAndTime: DateTime(2021, 9, 12, 9, 30),
    isCompleted: false,
  ),
  Task(
    taskText: 'This is the ninth test task',
    taskDueDateAndTime: DateTime(2021, 9, 12, 9, 30),
    isCompleted: false,
  ),
  Task(
    taskText: 'This is the tenth test task',
    taskDueDateAndTime: DateTime(2021, 9, 12, 9, 30),
    isCompleted: true,
  ),
  Task(
    taskText: 'This is the eleventh test task',
    taskDueDateAndTime: DateTime(2021, 9, 12, 9, 30),
    isCompleted: false,
  ),
  Task(
    taskText: 'This is the twelfth test task',
    taskDueDateAndTime: DateTime(2021, 4, 12, 9, 30),
    isCompleted: false,
  ),
];

List<Task> tasksSortedByDueDate() {
  // sorting by comparing due times.
  tasks.sort((a, b) => a.taskDueDateAndTime.compareTo(b.taskDueDateAndTime));
  return tasks;
  // List<Task> tempListOfTasks = [];
  // DateTime tempDateTime;
  // for (int index = 0; index < tasks.length; index++) {
  //   if (tasks[index]
  //       .taskDueDateAndTime
  //       .difference(tasks[index + 1].taskDueDateAndTime)
  //       .isNegative) {}
  // }
}
