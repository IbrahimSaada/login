import 'package:flutter/material.dart';
import 'package:login2/home/chat_page.dart'; // Import the chat_page

class ContactsPage extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
        name: 'John Doe',
        description: 'Software Engineer',
        imageUrl: 'https://via.placeholder.com/150',
        lastSeen: '2 hours ago',
        lastMessage: '',
        isOnline: true),
    Contact(
        name: 'Jane Smith',
        description: 'Product Manager',
        imageUrl: 'https://via.placeholder.com/150',
        lastSeen: '5 minutes ago',
        lastMessage: 'See you tomorrow!',
        isOnline: false),
    Contact(
        name: 'Michael Brown',
        description: 'UX Designer',
        imageUrl: 'https://via.placeholder.com/150',
        lastSeen: '1 hour ago',
        lastMessage: 'Can you review this design?',
        isOnline: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {
              // Handle camera action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Messages',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ContactCard(
                  contact: contacts[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatPage(contact: contacts[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Contact {
  final String name;
  final String description;
  final String imageUrl;
  final String lastSeen;
  final String lastMessage;
  final bool isOnline;

  Contact({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.lastSeen,
    required this.lastMessage,
    required this.isOnline,
  });
}

class ContactCard extends StatelessWidget {
  final Contact contact;
  final VoidCallback onTap; // Add this callback

  ContactCard({required this.contact, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Stack(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(contact.imageUrl),
              radius: 25.0,
            ),
            if (contact.isOnline)
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 8.0,
                ),
              ),
          ],
        ),
        title: Text(contact.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contact.description),
            Text(contact.lastMessage.isNotEmpty
                ? 'Message: ${contact.lastMessage}'
                : 'Last seen: ${contact.lastSeen}'),
          ],
        ),
        trailing: Icon(Icons.camera_alt, color: Colors.orange),
        onTap: onTap, // Call the callback when tapped
      ),
    );
  }
}
