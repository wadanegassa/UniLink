import 'package:flutter/material.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _error;

  void _handleRegister() {
    setState(() => _error = null);
    // For now, just navigate to student home
    Navigator.pushReplacementNamed(context, '/student_home');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER SECTION
            Container(
              padding: const EdgeInsets.only(top: 50),
              height: size.height * 0.2,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFBBF24), Color(0xFFFFE082)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: const Center(
                child: Text(
                  "Welcome back",
                  style: TextStyle(
                    fontFamily: 'PirataOne',
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomTextField(
                      controller: _emailController,
                      label: 'Email',
                      icon: Icons.email_outlined),
                  const SizedBox(height: 15),
                  CustomTextField(
                      controller: _passwordController,
                      label: 'Password',
                      icon: Icons.lock_outline,
                      isPassword: true),
                  const SizedBox(height: 25),
                  if (_error != null)
                    Text(
                      _error!,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _handleRegister,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFBBF24),
                        foregroundColor: Colors.black,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context ,'/register'),
                    child: const Text(
                      "Don't have an account? Sign up",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
