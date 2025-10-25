import 'package:campus_connect/screens/home/student/bottom_nav/chat/chat_conversation.dart';
import 'package:flutter/material.dart';
import 'package:campus_connect/widgets/chat_tile.dart';
import 'package:iconsax/iconsax.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  final List<Map<String, String>> chats = const [
    {
      'name': 'Alice Johnson',
      'lastMessage': 'Hey, did you submit the assignment?',
      'time': '09:45 AM',
      'avatarUrl': 'https://i.pravatar.cc/150?img=1',
    },
    {
      'name': 'Bob Smith',
      'lastMessage': 'I found your notebook!',
      'time': 'Yesterday',
      'avatarUrl': 'https://i.pravatar.cc/150?img=2',
    },
    {
      'name': 'Campus Union',
      'lastMessage': 'Don’t forget the meeting tomorrow.',
      'time': 'Mon',
      'avatarUrl': 'https://i.pravatar.cc/150?img=3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ChatTile(
            name: chat['name']!,
            lastMessage: chat['lastMessage']!,
            time: chat['time']!,
            avatarUrl: chat['avatarUrl']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ConversationScreen(chatName: chat['name']!),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFBBF24),
        onPressed: () {
          // Open new chat screen (could be a contact selection page)
        },
        child: const Icon(Iconsax.edit, color: Colors.black),
      ),
    );
  }
}
