import 'package:campus_connect/widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'chat_conversation.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chats = [
      {
        'name': 'Union Office',
        'message': 'Your event report has been approved.',
        'time': '2:45 PM',
        'image': 'https://i.pravatar.cc/150?img=5'
      },
      {
        'name': 'Security Team',
        'message': 'Lost item found near library.',
        'time': '11:20 AM',
        'image': 'https://i.pravatar.cc/150?img=12'
      },
      {
        'name': 'Student Council',
        'message': 'Meeting starts at 5:00 PM.',
        'time': 'Yesterday',
        'image': 'https://i.pravatar.cc/150?img=8'
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBBF24),
        elevation: 0,
        title: const Text(
          'Messages',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Iconsax.search_normal, color: Colors.black),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ChatTile(
            name: chat['name']!,
            message: chat['message']!,
            time: chat['time']!,
            imageUrl: chat['image']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatConversationScreen(
                    name: chat['name']!,
                    imageUrl: chat['image']!,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFBBF24),
        onPressed: () {},
        child: const Icon(Iconsax.message_add, color: Colors.white),
      ),
    );
  }
}
