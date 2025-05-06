// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kart_flutter/data/repository/login_repository.dart';
import 'package:kart_flutter/domain/models/piloto/piloto.dart';
import 'package:kart_flutter/routing/routes.dart';
import 'package:kart_flutter/ui/home/home_viewmodel.dart';
import 'package:kart_flutter/ui/home/widgets/grafico_home.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel viewModel;
  const HomePage({super.key, required this.viewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Piloto>? value;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Schedule getData to run after the first frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        widget.viewModel.getData.execute();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      _isInitialized = true;
    }

    final isLoggedIn = context.watch<LoginRepository>().isAuthenticated;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kart - TI',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          if (isLoggedIn)
            IconButton(
              onPressed: () async {
                await context.read<LoginRepository>().logout();
              },
              icon: const Icon(Icons.logout),
            )
          else
            IconButton(
              onPressed: () {
                context.pushNamed(Routes.login);
              },
              icon: const Icon(Icons.person),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListenableBuilder(
            listenable: Listenable.merge([
              widget.viewModel,
              widget.viewModel.getData,
              widget.viewModel.getTemporada,
            ]),
            builder: (context, _) {
              final isRunning = widget.viewModel.getData.isRunning;
              final temporadas = widget.viewModel.temporadas;
              final temporadaSelecionada =
                  widget.viewModel.temporadaSelecionada;

              if (isRunning) {
                return const Center(child: CircularProgressIndicator());
              }

              if (temporadaSelecionada == null) {
                return const Center(
                  child: Text('Nenhuma temporada encontrada'),
                );
              }

              return Column(
                children: [
                  DropdownButton(
                    isExpanded: true,
                    value: temporadaSelecionada,
                    items:
                        temporadas!
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Row(
                                  children: [
                                    Text(e.descricao),
                                    if (e.isTemporadaAtual) ...[
                                      const SizedBox(width: 8),
                                      const Icon(Icons.star, size: 16),
                                    ],
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {
                      widget.viewModel.getTemporada.execute(value!);
                    },
                  ),
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
                                temporadaSelecionada.descricao,
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              if (temporadaSelecionada.isTemporadaAtual)
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
                                        const Icon(
                                          Icons.star_purple500_sharp,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          'Ativa',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium?.copyWith(
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
                              backgroundColor: Colors.white,
                              foregroundColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            onPressed:
                                () => context.pushNamed(
                                  Routes.temporadas,
                                  pathParameters: {
                                    'idTemporada':
                                        temporadaSelecionada.idTemporada!
                                            .toString(),
                                  },
                                ),
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
                  if (isLoggedIn) ...[
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        _iconButton(
                          icon: Icons.flag,
                          title: 'Nova Corrida',
                          onTap: () {},
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        _iconButton(
                          icon: Icons.person_add,
                          title: 'Novo Piloto',
                          onTap: () {},
                          color: const Color(0xFF38d2c0),
                        ),
                        _iconButton(
                          icon: Icons.calendar_today,
                          title: 'Nova Temporada',
                          onTap: () {},
                          color: const Color(0xFFed8b5f),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 24),
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
          Icon(icon),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(title, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }

  Widget _iconButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required Color color,
  }) {
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
                color: color.withAlpha(30),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
