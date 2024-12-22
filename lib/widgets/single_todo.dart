import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SingleTodo extends StatelessWidget {
  const SingleTodo({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.handleChange,
    this.handleDelete,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? handleChange;
  final Function(BuildContext)? handleDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: handleDelete,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(15),
            label: 'delete',
            autoClose: true,
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: handleChange,
                checkColor: Colors.black,
                activeColor: Colors.white,
                side: const BorderSide(color: Colors.white),
              ),
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
