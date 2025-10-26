import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBBF24),
        elevation: 0,
        title: const Text('More', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ===== Options =====
            _MoreOption(
              icon: Iconsax.setting_2,
              title: 'Settings',
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
            _MoreOption(
              icon: Iconsax.support,
              title: 'Help & Support',
              onTap: () => Navigator.pushNamed(context, '/support'),
            ),
            _MoreOption(
              icon: Iconsax.map_1,
              title: 'Campus Map',
              onTap: () => Navigator.pushNamed(context, '/campus_map'),
            ),
            _MoreOption(
              icon: Iconsax.info_circle,
              title: 'About UniLink',
              onTap: () => showAboutDialog(
                context: context,
                applicationName: 'Campus Connect',
                applicationVersion: '1.0.0',
                children: const [
                  Text(
                      'Campus Connect helps students report lost/found items, submit suggestions, stay updated on events, and stay safe.'),
                ],
              ),
            ),
            _MoreOption(
              icon: Iconsax.logout,
              title: 'Logout',
              color: Colors.redAccent,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // close dialog
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/login', (route) => false);
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ===== Option Card Widget =====
class _MoreOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? color;

  const _MoreOption({
    required this.icon,
    required this.title,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: color ?? Colors.black87),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: color ?? Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(Iconsax.arrow_right_1, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
