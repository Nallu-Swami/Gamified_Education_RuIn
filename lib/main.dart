import 'package:flutter/material.dart';

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
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

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
              controller: yearController,
              decoration: const InputDecoration(
                labelText: 'Year of Study',
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final String name = nameController.text;
                final String year = yearController.text;
                // Perform login logic with name and year

                // Example validation
                if (name.isNotEmpty && year.isNotEmpty) {
                  // Navigate to the home screen or perform necessary actions
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(name: name, year: year),
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

class HomeScreen extends StatelessWidget {
  final String name;
  final String year;

  const HomeScreen({Key? key, required this.name, required this.year}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome, $name!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Year of Study: $year',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
