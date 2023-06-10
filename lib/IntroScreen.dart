import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ToDoPage extends StatefulWidget {
  final String name;
  final String password;

  const ToDoPage({Key? key, required this.name, required this.password}) : super(key: key);

  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Study-Quests'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              // Handle list icon button press
            },
            icon: Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              onPressed: _addTask,
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 23, 0, 49),
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
                                color: const Color.fromARGB(255, 255, 255, 255),
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
                              'Experience: 0/100',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 255, 255, 255),
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
                              'Struggle: 1/NeverEnds',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 255, 255, 255),
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
                'Student-Objectives',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
  itemCount: tasks.length,
  separatorBuilder: (context, index) => Divider(),
  itemBuilder: (context, index) {
    final task = tasks[index];
    bool isTaskCompleted = false;

    return Container(
      color: Color.fromARGB(255, 16, 50, 161), // Customize the tile background color as needed
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://example.com/task_image.png'), // Replace with the URL of the task's image
        ),
        title: Text(
          task,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Checkbox(
          value: isTaskCompleted,
          onChanged: (value) {
            setState(() {
              isTaskCompleted = value!;
              if (isTaskCompleted) {
                tasks.removeAt(index);
              }
            });
          },
        ),
      ),
    );
  },
),
),
            ],
          ),
        ),
      ),
    );
  }

  void _addTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTask = '';
        String selectedTaskType = '';

        return AlertDialog(
          title: Text(
            'Add Task',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (value) {
                  newTask = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter task...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Task Type:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ChoiceChip(
                    label: Text('Maths'),
                    selected: selectedTaskType == 'Maths',
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedTaskType = 'Maths';
                        }
                      });
                    },
                  ),
                  ChoiceChip(
                    label: Text('Physics'),
                    selected: selectedTaskType == 'Physics',
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedTaskType = 'Physics';
                        }
                      });
                    },
                  ),
                  ChoiceChip(
                    label: Text('Chemistry'),
                    selected: selectedTaskType == 'Chemistry',
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedTaskType = 'Chemistry';
                        }
                      });
                    },
                  ),
                  ChoiceChip(
                    label: Text('Computer-Science'),
                    selected: selectedTaskType == 'Computer-Science',
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedTaskType = 'Computer-Science';
                        }
                      });
                    },
                  ),
                  ChoiceChip(
                    label: Text('Literature'),
                    selected: selectedTaskType == 'Literature',
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedTaskType = 'Literature';
                        }
                      });
                    },
                  ),
                  // Add more options as needed
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.add('$newTask ($selectedTaskType)');
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
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
