import 'package:flutter/material.dart';
import 'package:simple_todo/widgets/single_todo.dart';

class TodoList extends StatefulWidget {
  final List todoList;

  const TodoList({
    super.key,
    required this.todoList,
  });

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void checkBoxChanged(int index) {
    setState(() {
      widget.todoList[index]['check'] = !widget.todoList[index]['check'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.todoList.length,
        itemBuilder: (BuildContext context, index) {
          return SingleTodo(
            taskName: widget.todoList[index]['name'],
            taskCompleted: widget.todoList[index]['check'],
            handleChange: (value) => checkBoxChanged(index),
            handleDelete: (context) => {
              setState(() {
                widget.todoList.removeAt(index);
              })
            },
          );
        });
  }
}
