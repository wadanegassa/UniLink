import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatConversationScreen extends StatefulWidget {
  final String name;
  final String imageUrl;

  const ChatConversationScreen({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  State<ChatConversationScreen> createState() => _ChatConversationScreenState();
}

class _ChatConversationScreenState extends State<ChatConversationScreen> {
  final TextEditingController _messageController = TextEditingController();

  // Dummy messages for UI demo
  final List<Map<String, dynamic>> messages = [
    {'text': 'Hey! Did you check the lost item update?', 'isMe': false},
    {'text': 'Yes! I saw it this morning.', 'isMe': true},
    {'text': 'Good, make sure to report if it’s yours.', 'isMe': false},
    {'text': 'Sure thing, thanks!', 'isMe': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFBBF24),
        leadingWidth: 30,
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(widget.imageUrl),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Online',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Iconsax.call, color: Colors.black),
          ),
        ],
      ),

      // 💬 Body (Messages)
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              reverse: true, // latest message at bottom
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[messages.length - 1 - index];
                return Align(
                  alignment: message['isMe']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: message['isMe']
                          ? const Color(0xFFFBBF24)
                          : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: message['isMe']
                            ? const Radius.circular(16)
                            : const Radius.circular(0),
                        bottomRight: message['isMe']
                            ? const Radius.circular(0)
                            : const Radius.circular(16),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      message['text'],
                      style: TextStyle(
                        color: message['isMe'] ? Colors.white : Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // 📝 Message Input
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Iconsax.emoji_happy, color: Colors.grey),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Iconsax.send_1, color: Color(0xFFFBBF24)),
                  onPressed: () {
                    if (_messageController.text.trim().isEmpty) return;
                    setState(() {
                      messages.add({
                        'text': _messageController.text,
                        'isMe': true,
                      });
                      _messageController.clear();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
