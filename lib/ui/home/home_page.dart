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
    widget.viewModel.getTemporadas.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kart - TI')),
      body: ListenableBuilder(
        listenable: Listenable.merge([
          widget.viewModel,
          widget.viewModel.getTemporadas,
        ]),
        builder: (context, _) {
          final isRunning = widget.viewModel.getTemporadas.isRunning;

          if (isRunning) {
            return const Center(child: CircularProgressIndicator());
          }

          final temporadas = widget.viewModel.temporadas;
          if (temporadas.isEmpty) {
            return const Center(child: Text('Nenhuma temporada encontrada'));
          }

          return ListView.builder(
            itemCount: temporadas.length,
            itemBuilder: (context, index) => Text(temporadas[index].toString()),
          );
        },
      ),
    );
  }
}
