import 'package:kart_flutter/config/remote/repositories_dependecies.dart';
import 'package:kart_flutter/config/remote/services_dependecies.dart';
import 'package:kart_flutter/config/remote/viewmodels_dependecies.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  return [
    // Services
    ...ServicesDependecies().servicesRemote,
    // Repositories
    ...RepositoriesDependecies().repositoriesRemote,
    // ViewModels
    ...ViewModelsDependecies().viewModelsRemote,
  ];
}
