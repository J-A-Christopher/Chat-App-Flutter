import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: const Text('This works !'),
          );
        },
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/cp46KeHycKCrhdnp8gQX/messages')
              .snapshots()
              .listen((data) {
            for (var document in data.docs) {
              print(document['text']);
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
