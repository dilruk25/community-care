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

class CommunityChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Chat'),
      ),
      body: Center(
        child: Text('Welcome to Community Chat!'),
      ),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Center(
        child: Text('User Profile Details'),
      ),
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
              title: Text('Community News'),
              onTap: () {
                // Handle login tap.
              },
            ),
            ListTile(
              title: Text('Community Calender'),
              onTap: () {
                // Handle chat tap.
              },
            ),
            ListTile(
              title: Text('Community Chat'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityChatPage()),
                );
              },
            ),
            ListTile(
              title: Text('Community Requests'),
              onTap: () {
                // Handle community calendar tap.
              },
            ),
            ListTile(
              title: Text('Community Jobs'),
              onTap: () {
                // Handle assistance requests tap.
              },
            ),
            ListTile(
              title: Text('Community Business '),
              onTap: () {
                // Handle notifications tap.
              },
            ),
            ListTile(
              title: Text('Community Map'),
              onTap: () {
                // Handle log out tap.
              },
            ),
            ListTile(
              title: Text('Emergency'),
              onTap: () {
                // Handle family surname tap.
              },
            ),
            ListTile(
              title: Text('Log Out'),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CommunityChatPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserProfilePage()),
            );
          }
        },
      ),
    );
  }
}
