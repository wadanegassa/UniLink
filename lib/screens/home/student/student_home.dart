import 'package:campus_connect/screens/home/student/bottom_nav/chat/chat_screen.dart';
import 'package:campus_connect/screens/home/student/bottom_nav/home_content.dart';
import 'package:campus_connect/screens/home/student/bottom_nav/more_screen.dart';
import 'package:campus_connect/screens/home/student/bottom_nav/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const ChatScreen(),
    const ProfileScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFFFBBF24),
      unselectedItemColor: Colors.black54,
      showUnselectedLabels: true,
      currentIndex: _selectedIndex,
      onTap: (index) => setState(() => _selectedIndex = index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Iconsax.home_1), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Iconsax.message), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Iconsax.menu), label: 'More'),
      ],
    );
  }
}
