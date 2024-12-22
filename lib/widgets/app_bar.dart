import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Center(
          child: Text(
            'Simple Todo',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white);
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
