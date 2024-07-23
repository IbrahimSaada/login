import 'package:flutter/material.dart';


class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
   
            ListTile(
              leading: Icon(Icons.lock, color: Colors.lightBlue),
              title: Text('Change password'),
            ),
             ListTile(
              leading: Icon(Icons.notifications, color: Colors.orange),
              title: Text('Notification setting'),
            ),
            

          ],
        ),
      ),
    );
  }
}