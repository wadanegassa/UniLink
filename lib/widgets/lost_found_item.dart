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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== Image on top =====
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: imageUrl.isNotEmpty
                ? Image.asset(
                    imageUrl,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/placeholder.png',
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
          ),

          // ===== Content =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title & Status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: isLost
                            ? Colors.redAccent.withOpacity(0.15)
                            : Colors.green.withOpacity(0.15),
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
                  ],
                ),
                const SizedBox(height: 6),
                // Description
                Text(
                  desc,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 6),
                // Location & Date
                Row(
                  children: [
                    const Icon(Iconsax.location, size: 16, color: Colors.black54),
                    const SizedBox(width: 4),
                    Expanded(
                        child: Text(location, style: const TextStyle(color: Colors.black54))),
                    const Icon(Iconsax.calendar, size: 16, color: Colors.black54),
                    const SizedBox(width: 4),
                    Text(date, style: const TextStyle(color: Colors.black54)),
                  ],
                ),
                const SizedBox(height: 10),
                // Chat & Call buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
