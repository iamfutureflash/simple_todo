import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _todoController = TextEditingController();

  List todoList = [
    {"name": 'learn Flutter', "check": true},
    {"name": 'Drink coffee', "check": false},
    {"name": 'Hello Puneet 123', "check": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: const CustomAppBar(),
      body: TodoList(
        todoList: todoList,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _todoController,
                decoration: InputDecoration(
                    hintText: 'Add a new todo items',
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(15))),
              ),
            )),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  todoList.add({"name": _todoController.text, "check": false});
                  _todoController.clear();
                });
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
