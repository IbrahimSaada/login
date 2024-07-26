import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, // Add this line to remove the debug watermark
      home: NotificationPage(),
    ),
  );
}

class NotificationPage extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationPage> {
  List<Notification> _notifications = [
    Notification(
      title: 'New Like',
      message: 'Your post has been liked by Jane Doe',
      time: '2 hours ago',
      username: 'janeDoe',
      profilePhoto: 'https://picsum.photos/200/301',
    ),
    Notification(
      title: 'New Comment',
      message: 'John Doe has commented on your post',
      time: '3 hours ago',
      username: 'johnDoe',
      profilePhoto: 'https://picsum.photos/200/300',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 10), // Add a margin at the bottom
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black), // Add a black border
              borderRadius: BorderRadius.circular(10),
            ),
            child: Card(
              elevation: 0, // Remove the card's elevation
              color: Colors.transparent, // Make the card transparent
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(_notifications[index].profilePhoto),
                          radius: 20,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _notifications[index].username,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(_notifications[index].title),
                            Text(_notifications[index].message),
                            Text(
                              _notifications[index].time,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text('Mark as read'),
                        ),
                        PopupMenuItem(
                          child: Text('Delete'),
                        ),
                      ],
                      child: Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Notification {
  final String title;
  final String message;
  final String time;
  final String username;
  final String profilePhoto;

  Notification({
    required this.title,
    required this.message,
    required this.time,
    required this.username,
    required this.profilePhoto,
  });
}