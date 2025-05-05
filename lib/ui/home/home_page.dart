// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:kart_flutter/domain/models/piloto/piloto.dart';
import 'package:kart_flutter/ui/home/home_viewmodel.dart';
import 'package:kart_flutter/ui/home/widgets/grafico_home.dart';

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
    widget.viewModel.getData.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kart - TI',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListenableBuilder(
            listenable: Listenable.merge([
              widget.viewModel,
              widget.viewModel.getData,
            ]),
            builder: (context, _) {
              final isRunning = widget.viewModel.getData.isRunning;

              if (isRunning) {
                return const Center(child: CircularProgressIndicator());
              }

              final temporadaAtual = widget.viewModel.temporadaAtual;
              if (temporadaAtual == null) {
                return const Center(
                  child: Text('Nenhuma temporada encontrada'),
                );
              }

              return Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            const Color.fromARGB(255, 130, 118, 240),
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
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.surface,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Ativa',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium?.copyWith(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.surface,
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
                              _iconInfo(
                                'Pilotos',
                                widget.viewModel.pilotosDaTemporada!.length
                                    .toString(),
                                Icons.people,
                              ),
                              _iconInfo(
                                'Corridas',
                                widget.viewModel.corridasDaTemporada!.length
                                    .toString(),
                                Icons.flag,
                              ),
                              _iconInfo(
                                'Participações',
                                widget.viewModel.participantesDaTemporada!
                                    .toString(),
                                Icons.check_circle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.surface,
                              foregroundColor:
                                  Theme.of(context).colorScheme.primary,
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
                                    color:
                                        Theme.of(context).colorScheme.primary,
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
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      _iconButton(
                        Icons.flag,
                        'Nova Corrida',
                        () {},
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.primaryContainer,
                      ),
                      _iconButton(
                        Icons.person_add,
                        'Novo Piloto',
                        () {},
                        const Color(0xFF38d2c0),
                        const Color.fromARGB(255, 228, 243, 247),
                      ),
                      _iconButton(
                        Icons.calendar_today,
                        'Nova Temporada',
                        () {},
                        const Color(0xFFed8b5f),
                        const Color.fromARGB(255, 245, 233, 227),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Column(
                  //   children: [
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           'Top Pilotos',
                  //           style: Theme.of(context).textTheme.titleLarge
                  //               ?.copyWith(fontWeight: FontWeight.w500),
                  //         ),
                  //         TextButton.icon(
                  //           onPressed: () {},
                  // ignore: lines_longer_than_80_chars
                  //           icon: const Icon(Icons.arrow_forward_ios, size: 14),
                  //           label: const Text(
                  //             'Ver Ranking completo',
                  //             style: TextStyle(
                  //               fontWeight: FontWeight.w500,
                  //               fontSize: 15,
                  //             ),
                  //           ),
                  //           iconAlignment: IconAlignment.end,
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  GraficoHome(pilotos: widget.viewModel.pilotosDaTemporada!),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _iconInfo(String title, String value, IconData icon) {
    return Expanded(
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

  Widget _iconButton(
    IconData icon,
    String title,
    VoidCallback onTap,
    Color iconColor,
    Color backgroundColor,
  ) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
