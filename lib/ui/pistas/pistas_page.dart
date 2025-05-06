import 'package:flutter/material.dart';

class PistasPage extends StatelessWidget {
  const PistasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pistas',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(child: Text('Página de Pistas')),
    );
  }
}
