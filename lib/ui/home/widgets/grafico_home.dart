import 'package:flutter/material.dart';
import 'package:kart_flutter/domain/models/piloto/piloto.dart';

class GraficoHome extends StatefulWidget {
  final List<Piloto> pilotos;
  GraficoHome({super.key, required this.pilotos}) {
    pilotos.sort(
      (a, b) =>
          a.temporadaAtual!.posicao!.compareTo(b.temporadaAtual!.posicao!),
    );
  }

  @override
  State<GraficoHome> createState() => _GraficoHomeState();
}

class _GraficoHomeState extends State<GraficoHome>
    with TickerProviderStateMixin {
  // Controlador de animação
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _setupAnimationController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Restart animation when visible again
    _animationController
      ..reset()
      ..forward();
  }

  void _setupAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topThree =
        widget.pilotos.length > 3
            ? widget.pilotos.sublist(0, 3)
            : widget.pilotos;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Pilotos',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      'Ver ranking completo',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 12,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child:
              widget.pilotos.isEmpty
                  ? const Center(child: Text('Sem pilotos nesta temporada'))
                  : Stack(
                    alignment: Alignment.center,
                    children: [
                      // Podium background
                      Container(
                        height: 80,
                        margin: const EdgeInsets.only(top: 60),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withAlpha(30),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),

                      // Drivers
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            topThree.map((piloto) {
                              final isFirst =
                                  piloto.temporadaAtual!.posicao == 1;
                              final podiumHeight =
                                  isFirst
                                      ? 170.0
                                      : (piloto.temporadaAtual!.posicao == 2
                                          ? 140.0
                                          : 120.0);

                              // Criar uma animação que depende do controller
                              final delayedAnimation = CurvedAnimation(
                                parent: _animationController,
                                curve: Interval(
                                  // ignore: lines_longer_than_80_chars
                                  // Começar em momentos diferentes baseado na posição
                                  0.2 * (piloto.temporadaAtual!.posicao! - 1),
                                  1,
                                  curve: Curves.elasticOut,
                                ),
                              );

                              return AnimatedBuilder(
                                animation: delayedAnimation,
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset: Offset(
                                      0,
                                      (1.0 - delayedAnimation.value) * 100,
                                    ),
                                    child: Opacity(
                                      opacity: delayedAnimation.value.clamp(
                                        0.0,
                                        1.0,
                                      ),
                                      child: child,
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  width: isFirst ? 100.0 : 80.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // Driver image/avatar
                                      CircleAvatar(
                                        radius: isFirst ? 40.0 : 30.0,
                                        backgroundColor: _getPositionColor(
                                          piloto.temporadaAtual!.posicao!,
                                          context,
                                        ),
                                        child: CircleAvatar(
                                          radius: isFirst ? 36.0 : 26.0,
                                          backgroundColor:
                                              Theme.of(
                                                context,
                                              ).colorScheme.surface,
                                          backgroundImage:
                                              piloto.urlFoto != null
                                                  ? NetworkImage(
                                                    piloto.urlFoto!,
                                                  )
                                                  : null,
                                          child:
                                              piloto.urlFoto == null
                                                  ? Icon(
                                                    Icons.person,
                                                    size: isFirst ? 36.0 : 26.0,
                                                    color:
                                                        Theme.of(
                                                          context,
                                                        ).colorScheme.primary,
                                                  )
                                                  : null,
                                        ),
                                      ),

                                      // Podium pillar
                                      Container(
                                        width: isFirst ? 80.0 : 60.0,
                                        height: podiumHeight,
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              _getPositionColor(
                                                piloto.temporadaAtual!.posicao!,
                                                context,
                                              ),
                                              _getPositionColor(
                                                piloto.temporadaAtual!.posicao!,
                                                context,
                                              ).withAlpha(200),
                                            ],
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                          ),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                // ignore: lines_longer_than_80_chars
                                                '#${piloto.temporadaAtual!.posicao}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                              ),
                                              Text(
                                                // ignore: lines_longer_than_80_chars
                                                '${piloto.temporadaAtual!.pontos} pts',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      color: Colors.white,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      // Driver name
                                      SizedBox(
                                        width: 80,
                                        child: Text(
                                          piloto.nome.isNotEmpty
                                              ? piloto.nome
                                              : piloto.nome.split(' ').first,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyLarge!.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    ],
                  ),
        ),
      ],
    );
  }
}

Color _getPositionColor(int position, BuildContext context) {
  switch (position) {
    case 1:
      return const Color(0xFFFFD700); // Gold
    case 2:
      return const Color(0xFFC0C0C0); // Silver
    case 3:
      return const Color(0xFFCD7F32); // Bronze
    default:
      return Theme.of(context).colorScheme.secondary;
  }
}
