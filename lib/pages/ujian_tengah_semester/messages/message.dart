import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to add new contact page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddContactPage()),
            );
          },
          child: Text('Add New Contact'),
        ),
      ),
    );
  }
}

class AddContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Contact'),
      ),
      body: Center(
        child: Text('Form to add new contact goes here'),
      ),
    );
  }
}
