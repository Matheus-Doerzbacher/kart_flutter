import 'package:flutter/material.dart';

class CorridasPage extends StatelessWidget {
  const CorridasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Corridas',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(child: Text('Página de Corridas')),
    );
  }
}
