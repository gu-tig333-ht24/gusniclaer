import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;

  const CustomAppBar({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color.fromARGB(135, 207, 103, 162),
      title: Container(
        width: 150,
        decoration: BoxDecoration(
            border: Border.all(width: 2),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 0,
                  offset: Offset.fromDirection(0, 0))
            ],
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromARGB(255, 241, 188, 218)),
        child: Center(
          child: Text(
            'To Do-App',
          ),
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
