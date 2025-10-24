import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LostFoundItemCard extends StatelessWidget {
  final String title;
  final String desc;
  final String location;
  final String date;
  final String imageUrl;
  final String status;
  final String phone;

  const LostFoundItemCard({
    super.key,
    required this.title,
    required this.desc,
    required this.location,
    required this.date,
    required this.imageUrl,
    required this.status,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLost = status.toLowerCase() == 'lost';

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Item info
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: imageUrl.isNotEmpty
                  ? Image.network(imageUrl, width: 60, height: 60, fit: BoxFit.cover)
                  : Image.asset('assets/placeholder.png', width: 60, height: 60),
            ),
            title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('$desc\n📍 $location\n📅 $date'),
            isThreeLine: true,
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: isLost ? Colors.redAccent.withOpacity(0.15) : Colors.green.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status.toUpperCase(),
                style: TextStyle(
                  color: isLost ? Colors.red : Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Chat & Call buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to chat page with phone as argument
                      Navigator.pushNamed(context, '/chat', arguments: phone);
                    },
                    icon: const Icon(Iconsax.message, color: Colors.black),
                    label: const Text('Chat'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFBBF24),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Call the number (front-end only)
                      // In a real app, you would use url_launcher
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Calling $phone...')),
                      );
                    },
                    icon: const Icon(Iconsax.call, color: Colors.white),
                    label: const Text('Call', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
