import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';




class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body:  Column(
        children: [
          Expanded(child: MessageList()),
        ],
      ),
    );
  }
}

class ProfileBubble extends StatelessWidget {
  final String imagePath;
  final String name;

  const ProfileBubble(this.imagePath, this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 5),
        Text(name, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class MessageList extends StatelessWidget {
  final List<Message> messages = [
    Message("Shaimaa ", "Sent a Reels video", "19h", true),
    Message("Peter ", "Sent a Reels video", "3d", false),
    Message("☆Raghad☆", "Eh akid", "4d", false),
    Message("A.H.G", "@mahdi_r_drh", "6d", false),
    Message("Rima", "Seen last week", "", false),
    // Add more messages as needed
  ];

   MessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return MessageItem(messages[index]);
      },
    );
  }
}

class MessageItem extends StatelessWidget {
  final Message message;

  const MessageItem(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        child: message.isUnread
            ? const Icon(Icons.markunread, color: Colors.blue)
            : const Icon(Icons.done),
      ),
      title: Text(message.name),
      subtitle: Text(message.message),
      trailing: Text(message.time),
    );
  }
}

class Message {
  final String name;
  final String message;
  final String time;
  final bool isUnread;

  Message(this.name, this.message, this.time, this.isUnread);
}
