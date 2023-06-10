import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        appBar: AppBar(
          title: Text('Study-Quests'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  _launchURL('https://na.leagueoflegends.com/en/featured/events/avatar-creator#/');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage('https://example.com/avatar.png'), // Replace with the URL of the user's character icon
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, $name!',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Health: 100',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Experience: 50',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.assist_walker_outlined,
                              color: Colors.green,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Struggle: 1',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Text(
                'Tasks',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.check),
                      title: Text('Task 1skdbj'),
                    ),
                    ListTile(
                      leading: Icon(Icons.check),
                      title: Text('Task 2'),
                    ),
                    ListTile(
                      leading: Icon(Icons.check),
                      title: Text('Task 3'),
                    ),
                    // Add more list tiles for additional tasks
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
