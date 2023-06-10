import 'package:flutter/material.dart';

class ToDoPage extends StatelessWidget {
  final String name;
  final String password;

  const ToDoPage({Key? key, required this.name, required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle the back button press
        Navigator.pop(context); // Navigate back to the previous screen
        return false; // Return false to allow the back button press
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome, $name!',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
