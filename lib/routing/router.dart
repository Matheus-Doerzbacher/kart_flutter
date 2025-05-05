import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kart_flutter/routing/routes.dart';
import 'package:kart_flutter/ui/core/navigation/bottom_nav_bar.dart';
import 'package:kart_flutter/ui/corridas/corridas_page.dart';
import 'package:kart_flutter/ui/home/home_page.dart';
import 'package:kart_flutter/ui/perfil/perfil_page.dart';
import 'package:kart_flutter/ui/pilotos/pilotos_page.dart';
import 'package:kart_flutter/ui/temporadas/temporada_page.dart';
import 'package:provider/provider.dart';

// Criando o router como uma instância única
GoRouter appRouter() => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(body: child, bottomNavigationBar: BottomNavBar());
      },
      routes: [
        GoRoute(
          path: Routes.home,
          name: Routes.home,
          builder: (context, state) => HomePage(viewModel: context.read()),
        ),
        GoRoute(
          path: '/${Routes.pilotos}',
          name: Routes.pilotos,
          builder: (context, state) => const PilotosPage(),
        ),
        GoRoute(
          path: '/${Routes.corridas}',
          name: Routes.corridas,
          builder: (context, state) => const CorridasPage(),
        ),
        GoRoute(
          path: '/${Routes.perfil}',
          name: Routes.perfil,
          builder: (context, state) => const PerfilPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/${Routes.temporadas}',
      name: Routes.temporadas,
      builder: (context, state) => const TemporadaPage(),
    ),
  ],
);
