import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neighborly Assistance Hub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> tasks = [
    Task(title: 'Grocery Shopping', description: 'Help with grocery shopping'),
    Task(title: 'Yard Work', description: 'Assistance with yard maintenance'),
  ];

  // Global key to access the scaffold state
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Placeholder content for the main screen
  Widget _buildMainContent() {
    return TaskList(tasks: tasks);
  }

  // Function to handle opening the side navigation bar
  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  // Function to handle search box tap
  void _openSearchDialog() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the scaffold key
      appBar: AppBar(
        title: Text('Neighborly Assistance Hub'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _openDrawer, // Open side navigation bar
        ),
        actions: [
          // Logo Space
          Container(
            padding: EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/logo.png', // Replace with your logo image asset
              height: 24.0,
              width: 24.0,
            ),
          ),
          // Search Bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: _openSearchDialog, // Open search dialog
              child: Text('Search for...'),
            ),
          ),
        ],
      ),
      body: _buildMainContent(),
      drawer: Drawer(
        // Side Navigation Bar
        child: ListView(
          children: [
            ListTile(
              title: Text('Menu Item 1'),
              onTap: () {
                // Add code to handle side navigation item tap.
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Menu Item 2'),
              onTap: () {
                // Add code to handle side navigation item tap.
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Bottom Navigation Bar
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
        currentIndex: 0, // Change this to highlight the selected item
        onTap: (index) {
          // Add code to handle bottom navigation item tap.
        },
      ),
    );
  }
}
