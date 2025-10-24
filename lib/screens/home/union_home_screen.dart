import 'package:flutter/material.dart';

class UnionHomeScreen extends StatelessWidget {
  const UnionHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Union Home')),
      body: const Center(
        child: Text('Welcome Union Admin 🏛️'),
      ),
    );
  }
}
