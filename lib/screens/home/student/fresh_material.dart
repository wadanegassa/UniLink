import 'package:flutter/material.dart';

class FreshMaterial extends StatefulWidget {
  const FreshMaterial({super.key});

  @override
  State<FreshMaterial> createState() => _FreshMaterialState();
}

class _FreshMaterialState extends State<FreshMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fresh Material')),
    );
  }
}