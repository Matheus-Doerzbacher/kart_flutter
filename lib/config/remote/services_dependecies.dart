import 'package:kart_flutter/data/service/client_http.dart';
import 'package:kart_flutter/data/service/corrida/corrida_service.dart';
import 'package:kart_flutter/data/service/local_storage.dart';
import 'package:kart_flutter/data/service/piloto/piloto_service.dart';
import 'package:kart_flutter/data/service/temporada/temporada_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ServicesDependecies {
  List<SingleChildWidget> get servicesRemote {
    return [
      Provider(create: (context) => ClientHttp()),
      Provider(create: (context) => LocalStorage()),
      Provider(
        create: (context) => TemporadaService(clientHttp: context.read()),
      ),
      Provider(create: (context) => PilotoService(clientHttp: context.read())),
      Provider(create: (context) => CorridaService(clientHttp: context.read())),
    ];
  }
}
