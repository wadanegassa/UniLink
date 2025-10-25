import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  // Sample announcement data with local assets
  final List<Map<String, String>> announcements = const [
    {
      'title': 'Campus Cleaning Day',
      'description':
          'Join us this Friday for a campus-wide cleaning event! Volunteers get refreshments.',
      'image': 'assets/images/cleaning.jpg',
      'date': 'Oct 24, 2025',
    },
    {
      'title': 'Guest Lecture: Flutter Basics',
      'description':
          'Don’t miss the guest lecture on Flutter by Mr. Dev Expert in Room 101.',
      'image': 'assets/images/flutter_lecture.jpg',
      'date': 'Oct 26, 2025',
    },
    {
      'title': 'Library Extended Hours',
      'description':
          'The library will now be open until midnight during the exam week.',
      'image': 'assets/images/library.jpg',
      'date': 'Oct 28, 2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFB),
      body: Column(
        children: [
          // ===== TOP GOLD GRADIENT AREA =====
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFBBF24), Color(0xFFFFE082)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Iconsax.arrow_left,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                const Text(
                  'Announcements',
                  style: TextStyle(
                    fontFamily: 'PirataOne',
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.notification,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // ===== ANNOUNCEMENTS LIST =====
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: announcements.length,
              itemBuilder: (context, index) {
                final item = announcements[index];
                return _AnnouncementCard(
                  title: item['title']!,
                  description: item['description']!,
                  imagePath: item['image']!,
                  date: item['date']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AnnouncementCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String date;

  const _AnnouncementCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
          // Image from assets
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
              imagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'PirataOne',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                // Description
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 12),
                // Bottom Row (Date & Like Icon)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Iconsax.calendar,
                            size: 18, color: Colors.black54),
                        const SizedBox(width: 6),
                        Text(
                          date,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconsax.heart, color: Colors.redAccent),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
