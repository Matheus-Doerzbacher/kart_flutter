import 'package:kart_flutter/ui/home/home_viewmodel.dart';
import 'package:kart_flutter/ui/temporadas/temporadas_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ViewModelsDependecies {
  List<SingleChildWidget> get viewModelsRemote {
    return [
      ChangeNotifierProvider(
        create:
            (context) => HomeViewModel(
              temporadaRepository: context.read(),
              pilotoRepository: context.read(),
              corridaRepository: context.read(),
            ),
      ),
      ChangeNotifierProvider(
        create:
            (context) => TemporadasViewmodel(
              temporadaRepository: context.read(),
              pilotoRepository: context.read(),
              corridaRepository: context.read(),
            ),
      ),
    ];
  }
}
