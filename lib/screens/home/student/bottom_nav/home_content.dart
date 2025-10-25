import 'package:flutter/material.dart';
import 'package:campus_connect/widgets/category_card.dart';
import 'package:iconsax/iconsax.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== TOP WELCOME + STATS =====
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Welcome ',
                      style: TextStyle(
                        fontFamily: 'PirataOne',
                        fontSize: 32,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.location,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'What would you like to do today?',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 25),
                // Stats
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _StatItem(count: '5', label: 'Events'),
                      _StatItem(count: '12', label: 'Announcements'),
                      _StatItem(count: '3', label: 'Lost Items'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Explore',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'PirataOne',
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: [
                CategoryCard(
                  title: 'Lost & Found',
                  icon: Iconsax.search_normal,
                  color: const Color(0xFFFBBF24),
                  onTap: () => Navigator.pushNamed(context, '/lost_found'),
                ),
                CategoryCard(
                  title: 'Announcements',
                  icon: Icons.announcement,
                  color: const Color(0xFFFBBF24),
                  onTap: () => Navigator.pushNamed(context, '/announcements'),
                ),
                CategoryCard(
                  title: 'Events',
                  icon: Iconsax.calendar,
                  color: const Color(0xFFFBBF24),
                  onTap: () => Navigator.pushNamed(context, '/events'),
                ),
                CategoryCard(
                  title: 'Study Materials',
                  icon: Iconsax.document,
                  color: const Color(0xFFFBBF24),
                  onTap: () => Navigator.pushNamed(context, '/fresh_pdfs'),
                ),
                CategoryCard(
                  title: 'Emergency',
                  icon: Iconsax.call_calling5,
                  color: Colors.redAccent,
                  onTap: () => Navigator.pushNamed(context, '/emergency'),
                ),
                CategoryCard(
                  title: 'Suggestions',
                  icon: Iconsax.message_question,
                  color: const Color(0xFFFBBF24),
                  onTap: () => Navigator.pushNamed(context, '/suggestions'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String count;
  final String label;

  const _StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}
