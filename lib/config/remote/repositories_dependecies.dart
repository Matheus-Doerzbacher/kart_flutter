import 'package:kart_flutter/data/repository/temporada_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class RepositoriesDependecies {
  List<SingleChildWidget> get repositoriesRemote {
    return [
      // ChangeNotifierProvider(
      //   create: (context) => AuthRepositoryRemote(
      //     authClientHttp: context.read(),
      //     authLocalStorage: context.read(),
      //     clientHttp: context.read(),
      //     permissaoService: context.read(),
      //   ) as AuthRepository,
      // ),
      Provider(
        create:
            (context) => TemporadaRepository(temporadaService: context.read()),
      ),
    ];
  }
}
