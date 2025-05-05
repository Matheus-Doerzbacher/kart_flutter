import 'package:flutter/material.dart';

class PilotosPage extends StatelessWidget {
  const PilotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pilotos',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(child: Text('Página de Pilotos')),
    );
  }
}
