import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/utilities/task.dart';

class taskEntryScreen extends StatefulWidget {
  // const taskEntryScreen({Key? key}) : super(key: key);
  @override
  State<taskEntryScreen> createState() => _taskEntryScreenState();
}

class _taskEntryScreenState extends State<taskEntryScreen> {
  String? taskDescription;
  TimeOfDay? taskTime;
  DateTime? taskDateAndTime;

  final myController = TextEditingController();

  Task? assembleTask() {
    print('The value of the controller is: ${myController.text}');
    if (taskDescription != null &&
        taskDescription != '' &&
        taskDateAndTime != null) {
      return Task(
          taskText: taskDescription!,
          taskDueDateAndTime: taskDateAndTime!,
          isCompleted: false);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (picked != null) {
      setState(() {
        taskDateAndTime = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    taskTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        });
    int pickedHour = taskTime!.hour.toInt();
    int pickedMinute = taskTime!.minute.toInt();
    int pickedYear = taskDateAndTime!.year;
    int pickedMonth = taskDateAndTime!.month;
    int pickedDay = taskDateAndTime!.day;
    setState(() {
      taskDateAndTime = DateTime(
          pickedYear, pickedMonth, pickedDay, pickedHour, pickedMinute);
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'New Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: myController,
              maxLength: 30,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a description of the task.',
                hintStyle: TextStyle(
                  fontSize: 20,
                ),
                labelText: 'Task description',
              ),
              onChanged: (inputText) {
                taskDescription = myController.text;
              },
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                // side: const BorderSide(color: Colors.red, width: 2),
                minimumSize: Size(double.infinity, 38),
                elevation: 6.0,
                // primary: const Color(0xff757575),
                // backgroundColor: Color(0xffffccbc),
                textStyle: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _selectDate(context);
              },
              child: Text(
                taskDateAndTime == null
                    ? 'Select Date'
                    : DateFormat.yMMMd().format(taskDateAndTime!),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                elevation: 6.0,
                textStyle: TextStyle(fontSize: 20),
                minimumSize: Size(double.infinity, 38),
              ),
              onPressed: () => _selectTime(),
              child: Text(
                taskTime == null
                    ? 'Select time if required'
                    : DateFormat.Hm().format(taskDateAndTime!),
              ),
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(90.0, 36.0),
                    elevation: 6.0,
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    // taskDescription = 'Test task.';
                    Navigator.pop(context, assembleTask());
                  },
                  child: Text(
                    'Save',
                  ),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(90.0, 36.0),
                    elevation: 6.0,
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  onPressed: () => _selectTime(),
                  child: Text(
                    'Cancel',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
