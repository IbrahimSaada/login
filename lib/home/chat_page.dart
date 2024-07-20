import 'package:flutter/material.dart';
import 'package:login2/home/contacts_page.dart'; // Import the contacts_page

class ChatPage extends StatelessWidget {
  final Contact contact;

  ChatPage({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(contact.imageUrl),
              radius: 20.0,
            ),
            SizedBox(width: 10),
            Text(contact.name),
          ],
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8.0),
              children: [
                // Example messages
                ChatMessage(
                  text: "Hi there!",
                  isSentByMe: true,
                ),
                ChatMessage(
                  text: "Hello! How can I help you?",
                  isSentByMe: false,
                ),
                // Add more ChatMessage widgets as needed
              ],
            ),
          ),
          MessageComposer(),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isSentByMe;

  ChatMessage({required this.text, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.all(8.0),
        constraints: BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.orange : Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSentByMe ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}

class MessageComposer extends StatefulWidget {
  @override
  _MessageComposerState createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Type a message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.send, color: Colors.orange),
            onPressed: () {
              // Handle sending message
              String message = _controller.text;
              // Add message sending logic here

              // Clear the text field
              _controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
