import 'package:campus_connect/screens/auth/login_screen.dart';
import 'package:campus_connect/screens/auth/register_screen.dart';
import 'package:campus_connect/screens/home/student/announcement_screen.dart';
import 'package:campus_connect/screens/home/student/bottom_nav/chat/chat_screen.dart';
import 'package:campus_connect/screens/home/student/emergency_screen.dart';
import 'package:campus_connect/screens/home/student/events_screen.dart';
import 'package:campus_connect/screens/home/student/fresh_material.dart';
import 'package:campus_connect/screens/home/student/lost_found/lost_found_screen.dart';
import 'package:campus_connect/screens/home/student/lost_found/report_found.dart';
import 'package:campus_connect/screens/home/student/lost_found/report_lost.dart';
import 'package:campus_connect/screens/home/student/student_home.dart';
import 'package:campus_connect/screens/home/student/suggestion_screen.dart';
import 'package:campus_connect/screens/home/union_home_screen.dart';
import 'package:campus_connect/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'utils/app_theme.dart';

class CampusConnect extends StatelessWidget {
  const CampusConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Campus Connect',
        theme: AppTheme.lightTheme,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/onboarding': (context) => const OnboardingScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/student_home': (context) => const StudentHomeScreen(),
          '/union_home': (context) => const UnionHomeScreen(),
          '/lost_found': (context) => const LostFoundScreen(),
          '/report_lost': (context) => const ReportLostScreen(),
          '/report_found': (context) => const ReportFoundScreen(),
          '/announcements': (context) => const AnnouncementsScreen(),
          '/events': (context) => const EventsScreen(),
          '/fresh_pdfs': (context) => const FreshMaterial(),
          '/emergency': (context) => const EmergencyScreen(),
          '/suggestions': (context) => const SuggestionScreen(),
          '/chat':(context) => const ChatScreen(),
        });
  }
}
