import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Add Friends',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddFriendsPage(),
    );
  }
}

class AddFriendsPage extends StatefulWidget {
  @override
  _AddFriendsPageState createState() => _AddFriendsPageState();
}

class _AddFriendsPageState extends State<AddFriendsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Friends'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search functionality goes here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded( // Wrap with Expanded
              child: ListView.builder(
                itemCount: 1, // Replace with actual data
                itemBuilder: (context, index) {
                  return UserForm(
                    profilePhoto: 'assets/chef.jpg',
                    name: 'John Doe',
                    onAdd: () {
                      // Add friend functionality goes here
                    },
                    onRemove: () {
                      // Remove friend functionality goes here
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserForm extends StatelessWidget {
  final String profilePhoto;
  final String name;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  UserForm({
    required this.profilePhoto,
    required this.name,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(profilePhoto), // Use AssetImage
            ),
            SizedBox(width: 10),
            Text(
              name,
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
           ElevatedButton(
  onPressed: onAdd,
  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange), // Set button color to orange
  child: Text(
    'Add',
    style: TextStyle(color: Colors.white), // Set text color to white (since button color is orange)
  ),
),
            SizedBox(width: 10),
            ElevatedButton(
  onPressed: onRemove,
  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange), // Set button color to orange
  child: Text(
    'Remove',
    style: TextStyle(color: Colors.white), // Set text color to white (since button color is orange)
  ),
),
          ],
        ),
      ),
    );
  }
}