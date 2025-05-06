import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kart_flutter/domain/models/corrida/corrida.dart';
import 'package:kart_flutter/domain/models/piloto/piloto.dart';
import 'package:kart_flutter/domain/models/temporada/temporada.dart';
import 'package:kart_flutter/ui/temporadas/temporadas_viewmodel.dart';
import 'package:kart_flutter/ui/temporadas/widgets/modal_temporada.dart';
import 'package:provider/provider.dart';

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

    void _showModalTemporada(Temporada? temporada) {
      showModal(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 200),
            child: ModalTemporada(
              viewModel: context.read(),
              temporada: temporada,
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Temporadas')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showModalTemporada(null),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListenableBuilder(
            listenable: Listenable.merge([
              widget.viewModel,
              widget.viewModel.fetchTemporadas,
              widget.viewModel.atualizarTemporadaSelecionada,
            ]),
            builder: (context, _) {
              final isRunning = widget.viewModel.fetchTemporadas.isRunning;
              final temporadaSelecionada =
                  widget.viewModel.temporadaSelecionada;
              final temporadas = widget.viewModel.temporadas;
              final pilotosTemporada = widget.viewModel.pilotosDaTemporada;
              final corridasTemporada = widget.viewModel.corridasDaTemporada;

              if (isRunning) {
                return const Center(child: CircularProgressIndicator());
              }

              if (temporadas.isEmpty) {
                return const Center(
                  child: Text('Nenhuma temporada encontrada'),
                );
              }

              return Column(
                children: [
                  _selectTemporada(
                    temporadas,
                    temporadaSelecionada,
                    colorScheme,
                  ),
                  const SizedBox(height: 12),
                  _cardTemporada(temporadaSelecionada!, colorScheme, textTheme),
                  const SizedBox(height: 24),
                  _cardPilotos(
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                    pilotosTemporada: pilotosTemporada,
                  ),
                  const SizedBox(height: 24),
                  _cardClassificacao(
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                    pilotosTemporada: pilotosTemporada,
                  ),
                  const SizedBox(height: 24),
                  _cardCorridas(
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                    corridasTemporada: corridasTemporada,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FilledButton.icon(
                        onPressed:
                            () => _showModalTemporada(temporadaSelecionada),
                        label: const Text('Editar'),
                        icon: const Icon(Icons.edit),
                      ),
                      FilledButton.icon(
                        style: FilledButton.styleFrom(
                          backgroundColor: colorScheme.error.withAlpha(30),
                          foregroundColor: colorScheme.error,
                        ),
                        onPressed: () {},
                        label: const Text('Excluir'),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
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
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width - 48,
        ),
        child: Row(
          children:
              temporadas
                  .map(
                    (t) => Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.viewModel.atualizarTemporadaSelecionada
                                .execute(t);
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
                                if (t.isTemporadaAtual)
                                  const SizedBox(width: 4),
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
      ),
    );
  }

  Widget _cardTemporada(
    Temporada temporadaSelecionada,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                  temporadaSelecionada.descricao,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
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
                          const Icon(Icons.star_purple500_sharp, size: 16),
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
    );
  }

  Widget _cardPilotos({
    required ColorScheme colorScheme,
    required TextTheme textTheme,
    required List<Piloto>? pilotosTemporada,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.people, color: colorScheme.primary),
                const SizedBox(width: 6),
                Text(
                  'Pilotos (${pilotosTemporada?.length ?? 0})',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    'Gerenciar',
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(Icons.arrow_forward_ios, color: colorScheme.primary),
                ],
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
              pilotosTemporada != null && pilotosTemporada.isNotEmpty
                  ? ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width - 48,
                    ),
                    child: Row(
                      children:
                          pilotosTemporada
                              .map(
                                (piloto) => _pilotosPosition(
                                  piloto: piloto,
                                  colorScheme: colorScheme,
                                  textTheme: textTheme,
                                ),
                              )
                              .toList(),
                    ),
                  )
                  : const Center(child: Text('Nenhum piloto nesta temporada')),
        ),
      ],
    );
  }

  Widget _pilotosPosition({
    required Piloto piloto,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
  }) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: colorScheme.primary.withAlpha(30),
                child: Icon(Icons.person, size: 30, color: colorScheme.primary),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(piloto.temporadaAtual?.posicao.toString() ?? ''),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            piloto.nome,
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _cardClassificacao({
    required ColorScheme colorScheme,
    required TextTheme textTheme,
    required List<Piloto>? pilotosTemporada,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.emoji_events, color: colorScheme.primary),
                const SizedBox(width: 6),
                Text(
                  'Clasificação (${pilotosTemporada?.length ?? 0})',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    'Ver ranking',
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(Icons.arrow_forward_ios, color: colorScheme.primary),
                ],
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
              pilotosTemporada != null && pilotosTemporada.isNotEmpty
                  ? ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width - 48,
                    ),
                    child: Row(
                      children:
                          pilotosTemporada
                              .map(
                                (piloto) => _pilotosPontos(
                                  piloto: piloto,
                                  colorScheme: colorScheme,
                                  textTheme: textTheme,
                                ),
                              )
                              .toList(),
                    ),
                  )
                  : const Center(child: Text('Nenhum piloto nesta temporada')),
        ),
      ],
    );
  }

  Widget _pilotosPontos({
    required ColorScheme colorScheme,
    required TextTheme textTheme,
    required Piloto piloto,
  }) {
    return SizedBox(
      width: 120,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _getColor(piloto).withAlpha(30),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: _getColor(piloto),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    piloto.temporadaAtual?.posicao.toString() ?? '',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.surface,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '${piloto.temporadaAtual?.pontos} pts',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: _getColor(piloto),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: _getColor(piloto), width: 2),
            ),
            child: Icon(Icons.person, size: 30, color: colorScheme.primary),
          ),
          const SizedBox(height: 12),
          Text(
            piloto.nome,
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _cardCorridas({
    required ColorScheme colorScheme,
    required TextTheme textTheme,
    required List<Corrida>? corridasTemporada,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.emoji_events, color: colorScheme.primary),
                const SizedBox(width: 6),
                Text(
                  'Corridas (${corridasTemporada?.length ?? 0})',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    'Ver todas',
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(Icons.arrow_forward_ios, color: colorScheme.primary),
                ],
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
              corridasTemporada != null && corridasTemporada.isNotEmpty
                  ? ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width - 48,
                    ),
                    child: Row(
                      children:
                          corridasTemporada
                              .map(
                                (corrida) => _corridasRealizadas(
                                  corrida: corrida,
                                  colorScheme: colorScheme,
                                  textTheme: textTheme,
                                ),
                              )
                              .toList(),
                    ),
                  )
                  : const Center(child: Text('Nenhum piloto nesta temporada')),
        ),
      ],
    );
  }

  Widget _corridasRealizadas({
    required ColorScheme colorScheme,
    required TextTheme textTheme,
    required Corrida corrida,
  }) {
    return SizedBox(
      width: 180,
      child: Card(
        color: colorScheme.primary.withAlpha(30),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.emoji_events,
                    color: colorScheme.primary,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    corrida.pista?.nome ?? '',
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: colorScheme.secondary,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    DateFormat('dd/MM/yyyy').format(corrida.data),
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: colorScheme.secondary,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      corrida.pista?.local ?? '',
                      style: textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColor(Piloto piloto) {
    final posicao = piloto.temporadaAtual?.posicao;
    if (posicao == 1) {
      return Colors.yellow;
    } else if (posicao == 2) {
      return Colors.grey;
    } else if (posicao == 3) {
      return Colors.orange;
    } else {
      return Colors.white;
    }
  }
}
