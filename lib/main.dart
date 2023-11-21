import 'package:flutter/material.dart';

void main() {
  runApp(CommunityCareApp());
}

class Task {
  final String title;
  final String description;

  Task({required this.title, required this.description});
}

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index].title),
          subtitle: Text(tasks[index].description),
        );
      },
    );
  }
}

class CommunityCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CommunityCare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CommunityCareHomePage(),
    );
  }
}

class CommunityCareHomePage extends StatefulWidget {
  @override
  _CommunityCareHomePageState createState() => _CommunityCareHomePageState();
}

class _CommunityCareHomePageState extends State<CommunityCareHomePage> {
  List<Task> tasks = [
    Task(title: 'Grocery Shopping', description: 'Help with grocery shopping'),
    Task(title: 'Yard Work', description: 'Assistance with yard maintenance'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CommunityCare'),
        actions: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/logo.png', // Replace with your logo image asset
              height: 24.0,
              width: 24.0,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Search Box Tapped!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Search for...'),
            ),
          ),
        ],
      ),
      body: TaskList(tasks: tasks),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('john.doe@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                // Handle login tap.
              },
            ),
            ListTile(
              title: Text('Chat'),
              onTap: () {
                // Handle chat tap.
              },
            ),
            ListTile(
              title: Text('Profile Details'),
              onTap: () {
                // Handle profile details tap.
              },
            ),
            ListTile(
              title: Text('Community Calendar'),
              onTap: () {
                // Handle community calendar tap.
              },
            ),
            ListTile(
              title: Text('Assistance Requests'),
              onTap: () {
                // Handle assistance requests tap.
              },
            ),
            ListTile(
              title: Text('Notifications'),
              onTap: () {
                // Handle notifications tap.
              },
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                // Handle log out tap.
              },
            ),
            ListTile(
              title: Text('Family Surname'),
              onTap: () {
                // Handle family surname tap.
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Handle settings tap.
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        currentIndex: 0,
        onTap: (index) {
          // Handle bottom navigation item tap.
          if (index == 1) {
            // Navigate to Chat section
            // Implement your logic here
          } else if (index == 2) {
            // Navigate to Profile section
            // Implement your logic here
          }
        },
      ),
    );
  }
}
