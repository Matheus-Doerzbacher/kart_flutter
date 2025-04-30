// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:kart_flutter/domain/models/piloto/piloto.dart';
import 'package:kart_flutter/ui/home/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel viewModel;
  const HomePage({super.key, required this.viewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Piloto>? value;

  @override
  void initState() {
    super.initState();
    widget.viewModel.getTemporadaAtual.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kart - TI')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListenableBuilder(
          listenable: Listenable.merge([
            widget.viewModel,
            widget.viewModel.getTemporadaAtual,
          ]),
          builder: (context, _) {
            final isRunning = widget.viewModel.getTemporadaAtual.isRunning;

            if (isRunning) {
              return const Center(child: CircularProgressIndicator());
            }

            final temporadaAtual = widget.viewModel.temporadaAtual;
            if (temporadaAtual == null) {
              return const Center(child: Text('Nenhuma temporada encontrada'));
            }

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(
                        255,
                        112,
                        100,
                        231,
                      ), // Roxo mais escuro à esquerda
                      Color.fromARGB(
                        255,
                        130,
                        118,
                        240,
                      ), // Roxo mais claro à direita
                    ],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Primeira linha
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          temporadaAtual.descricao,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.surface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(50),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_purple500_sharp,
                                  size: 16,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Ativa',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Segunda linha
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _iconInfo('Pilotos', '13', Icons.people),
                        _iconInfo('Corridas', '4', Icons.flag),
                        _iconInfo('Participacoes', '44', Icons.check_circle),
                      ],
                    ),
                    const SizedBox(height: 12),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        foregroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Gerenciar Temporada',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.arrow_forward, size: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _iconInfo(String title, String value, IconData icon) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.surface),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ],
      ),
    );
  }
}
