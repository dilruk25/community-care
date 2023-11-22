import 'package:flutter/material.dart';

void main() {
  runApp(CommunityCareApp());
}

class Task {
  final String title;
  final String description;

  Task({required this.title, required this.description});
}

class UserProfile {
  final String name;
  final String surname;
  final String address;
  final String mobileNumber;

  UserProfile({
    required this.name,
    required this.surname,
    required this.address,
    required this.mobileNumber,
  });
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

class NewsContainer extends StatelessWidget {
  final String title;
  final String content;

  NewsContainer({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            content,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class RequestsContainer extends StatelessWidget {
  final String title;
  final String description;

  RequestsContainer({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            description,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
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
  final UserProfile user;

  UserProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${user.name} ${user.surname}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Address: ${user.address}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Mobile Number: ${user.mobileNumber}',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
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

  UserProfile userProfile = UserProfile(
    name: 'John',
    surname: 'Doe',
    address: '123 Main St, Cityville',
    mobileNumber: '123-456-7890',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CommunityCare'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // TODO: Implement settings functionality
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          Text(
            'News',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                NewsContainer(
                  title: 'Welfare Meeting',
                  content: 'Will be at 5.00 PM today.',
                ),
                NewsContainer(
                  title: 'Power Cut',
                  content: '8.00 AM - 12.00 PM\n23/11/2023',
                ),
                NewsContainer(
                  title: 'Garbage Collection',
                  content: 'At 7.00 AM\n24/11/2023',
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Requests',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          RequestsContainer(
            title: 'Grocery Shopping',
            description: 'Help with Grocery shopping',
          ),
          RequestsContainer(
            title: 'Yard Work',
            description: 'Assistance with yard maintenance',
          ),
        ],
      ),
     
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('${userProfile.name} ${userProfile.surname}'),
              accountEmail: Text('john.doe@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Handle login tap.
              },
            ),
            ListTile(
              title: Text('Community News'),
              onTap: () {
                // Handle login tap.
              },
            ),
            ListTile(
              title: Text('Community Calendar'),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityChatPage()),
                );
              },
            ),
            ListTile(
              title: Text('Community Jobs'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityChatPage()),
                );
              },
            ),
            ListTile(
              title: Text('Community Business'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityChatPage()),
                );
              },
            ),
            ListTile(
              title: Text('Community Map'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityChatPage()),
                );
              },
            ),
            ListTile(
              title: Text('Emergency'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityChatPage()),
                );
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
              MaterialPageRoute(builder: (context) => UserProfilePage(user: userProfile)),
            );
          }
        },
      ),
    );
  }
}
