import 'package:flutter/material.dart';
import 'package:kart_flutter/domain/models/temporada/temporada.dart';
import 'package:kart_flutter/ui/temporadas/temporadas_viewmodel.dart';

class ModalTemporada extends StatefulWidget {
  final Temporada? temporada;
  final TemporadasViewmodel viewModel;
  const ModalTemporada({super.key, this.temporada, required this.viewModel});

  @override
  State<ModalTemporada> createState() => _ModalTemporadaState();
}

class _ModalTemporadaState extends State<ModalTemporada> {
  final _formKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();
  final _anoController = TextEditingController();
  bool _isTemporadaAtual = false;

  @override
  void initState() {
    super.initState();
    if (widget.temporada != null) {
      _descricaoController.text = widget.temporada!.descricao;
      _anoController.text = widget.temporada!.ano.toString();
      _isTemporadaAtual = widget.temporada!.isTemporadaAtual;
    }

    widget.viewModel.upsertTemporada.addListener(_handleUpsertChanges);
  }

  @override
  void dispose() {
    widget.viewModel.upsertTemporada.removeListener(_handleUpsertChanges);
    super.dispose();
  }

  void _handleUpsertChanges() {
    final state = widget.viewModel.upsertTemporada;

    if (state.isSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Temporada salva com sucesso'),
            ),
          );
          Navigator.of(context).pop();
        }
      });
    }

    if (state.isFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Erro ao salvar temporada'),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final temporada = widget.temporada;
    return Scaffold(
      appBar: AppBar(
        title: Text(temporada != null ? 'Editar Temporada' : 'Nova Temporada'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.description),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          controller: _descricaoController,
                          decoration: const InputDecoration(
                            labelText: 'Descrição',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          controller: _anoController,
                          decoration: const InputDecoration(labelText: 'Ano'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.star),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Temporada Atual'),
                            Switch(
                              value: _isTemporadaAtual,
                              onChanged: (value) {
                                setState(() => _isTemporadaAtual = value);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancelar'),
                  ),
                  const SizedBox(width: 12),
                  ListenableBuilder(
                    listenable: widget.viewModel.upsertTemporada,
                    builder: (context, child) {
                      final isRunning =
                          widget.viewModel.upsertTemporada.isRunning;

                      return FilledButton(
                        onPressed:
                            isRunning
                                ? null
                                : () {
                                  widget.viewModel.upsertTemporada.execute(
                                    Temporada(
                                      idTemporada: temporada?.idTemporada,
                                      descricao: _descricaoController.text,
                                      ano: int.parse(_anoController.text),
                                      isTemporadaAtual: _isTemporadaAtual,
                                    ),
                                  );
                                },
                        child:
                            isRunning
                                ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(),
                                )
                                : const Text('Salvar'),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
