import 'package:kart_flutter/data/repository/corrida_repository.dart';
import 'package:kart_flutter/data/repository/login_repository.dart';
import 'package:kart_flutter/data/repository/piloto_repository.dart';
import 'package:kart_flutter/data/repository/temporada_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class RepositoriesDependecies {
  List<SingleChildWidget> get repositoriesRemote {
    return [
      ChangeNotifierProvider(
        create:
            (context) => LoginRepository(
              loginService: context.read(),
              httpService: context.read(),
            ),
      ),
      Provider(
        create:
            (context) => TemporadaRepository(temporadaService: context.read()),
      ),
      Provider(
        create: (context) => PilotoRepository(pilotoService: context.read()),
      ),
      Provider(
        create: (context) => CorridaRepository(corridaService: context.read()),
      ),
    ];
  }
}
