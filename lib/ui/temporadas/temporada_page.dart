import 'package:flutter/material.dart';

class TemporadaPage extends StatefulWidget {
  const TemporadaPage({super.key});

  @override
  State<TemporadaPage> createState() => _TemporadaPageState();
}

class _TemporadaPageState extends State<TemporadaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Temporadas')),
      body: const Center(child: Text('Temporadas')),
    );
  }
}
