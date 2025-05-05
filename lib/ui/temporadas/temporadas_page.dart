import 'package:flutter/material.dart';
import 'package:kart_flutter/domain/models/temporada/temporada.dart';
import 'package:kart_flutter/ui/temporadas/temporadas_viewmodel.dart';

class TemporadasPage extends StatefulWidget {
  final int idTemporada;
  final TemporadasViewmodel viewModel;
  const TemporadasPage({
    super.key,
    required this.viewModel,
    required this.idTemporada,
  });

  @override
  State<TemporadasPage> createState() => _TemporadasPageState();
}

class _TemporadasPageState extends State<TemporadasPage> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchTemporadas.execute(widget.idTemporada);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Temporadas')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListenableBuilder(
          listenable: Listenable.merge([
            widget.viewModel,
            widget.viewModel.fetchTemporadas,
          ]),
          builder: (context, _) {
            final isRunning = widget.viewModel.fetchTemporadas.isRunning;
            final temporadaSelecionada = widget.viewModel.temporadaSelecionada;
            final temporadas = widget.viewModel.temporadas;

            if (isRunning) {
              return const Center(child: CircularProgressIndicator());
            }

            if (temporadas.isEmpty) {
              return const Center(child: Text('Nenhuma temporada encontrada'));
            }

            return Column(
              children: [
                _selectTemporada(temporadas, temporadaSelecionada, colorScheme),
                const SizedBox(height: 12),
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
                          colorScheme.primary,
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
                              temporadaSelecionada?.descricao ?? '',
                              style: textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (temporadaSelecionada?.isTemporadaAtual ?? false)
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
                                        style: textTheme.bodyMedium?.copyWith(
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
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _selectTemporada(
    List<Temporada> temporadas,
    Temporada? temporadaSelecionada,
    ColorScheme colorScheme,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            temporadas
                .map(
                  (t) => Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.viewModel.temporadaSelecionada = t;
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color:
                                temporadaSelecionada == t
                                    ? colorScheme.primary
                                    : colorScheme.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color:
                                  temporadaSelecionada == t
                                      ? colorScheme.primary
                                      : colorScheme.outline,
                            ),
                          ),
                          child: Row(
                            children: [
                              if (t.isTemporadaAtual)
                                const Icon(
                                  Icons.star_purple500_sharp,
                                  size: 16,
                                ),
                              if (t.isTemporadaAtual) const SizedBox(width: 4),
                              Text(t.ano.toString()),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                )
                .toList(),
      ),
    );
  }
}
