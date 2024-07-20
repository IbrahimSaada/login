import 'package:flutter/material.dart';
import 'package:login2/menu/profile_page.dart';
class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
   Padding(
  padding: const EdgeInsets.all(16.0),
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    },
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/chef.jpg'),
          radius: 30,
        ),
        SizedBox(width: 16),
        Text(
          'Ahmad Ghosen',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
),
            ListTile(
              leading: Icon(Icons.people, color: Colors.lightBlue),
              title: Text('Friends'),
            ),
             ListTile(
              leading: Icon(Icons.bookmark, color: Colors.lightBlueAccent),
              title: Text('Saved Post'),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.orange),
              title: Text('Setting'),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.pink),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}