import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:study_ruin/IntroScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study_RuIns',
      theme: ThemeData(
        brightness: Brightness.dark, // Set the overall dark theme
        primarySwatch: Colors.deepPurple, // Customize the primary color
      ),
      debugShowCheckedModeBanner: false, // Remove the debug tag
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController(); // Change the controller name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade900,
              Colors.deepPurple.shade700,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password', // Change the label text
              ),
              obscureText: true, // Set the password field to obscure the text
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final String name = nameController.text;
                final String password = passwordController.text; // Change the variable name

                // Perform login logic with name and password

                // Example validation
                if (name.isNotEmpty && password.isNotEmpty) {
                  // Navigate to the To_do_page or perform necessary actions
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ToDoPage(name: name, password: password), // Change the parameter name
                    ),
                  );
                }
              },
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple.shade800,
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
