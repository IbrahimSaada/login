import 'package:flutter/material.dart';

class CommentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Add this line
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CommentItem> _comments = [
    CommentItem(
      userImage: 'assets/chef.jpg',
      userName: 'Jana',
      comment: 'Up',
      time: '1d',
    ),
    CommentItem(
      userImage: 'assets/chef.jpg',
      userName: 'Jana',
      comment: 'Up',
      time: '1d',
    ),
    CommentItem(
      userImage: 'assets/chef.jpg',
      userName: 'Jana',
      comment: 'Up',
      time: '1d',
    ),
   
  
    CommentItem(
      userImage: 'assets/chef.jpg',
      userName: 'Jana',
      comment: 'Ssh SouSou thank youuu',
      time: '1d',
    ),
  ];

  final _textController = TextEditingController();

  void _addComment() {
    if (_textController.text.trim().isNotEmpty) {
      setState(() {
        _comments.add(CommentItem(
          userImage: 'assets/images/user1.jpg',
          userName: 'New User',
          comment: _textController.text,
          time: 'now',
        ));
        _textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All comments'),
      ),
      body: Stack(
        children: [
          ListView(
            children: _comments,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Write a public comment...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50), // adjust the value to your liking
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                    onPressed: _addComment,
                    icon: Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  final String userImage;
  final String userName;
  final String comment;
  final String time;

  CommentItem({
    required this.userImage,
    required this.userName,
    required this.comment,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(userImage),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  comment,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Like'),
                    ),
                    SizedBox(width: 8.0),
                    TextButton(
                      onPressed: () {},
                      child: Text('Reply')
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}