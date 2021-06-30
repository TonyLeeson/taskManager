import 'package:flutter/material.dart';

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
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        title: Text(
          cardTaskDescription,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
