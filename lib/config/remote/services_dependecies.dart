import 'package:kart_flutter/data/service/core/http_service.dart';
import 'package:kart_flutter/data/service/core/local_storage.dart';
import 'package:kart_flutter/data/service/corrida_service.dart';
import 'package:kart_flutter/data/service/login_service.dart';
import 'package:kart_flutter/data/service/piloto_service.dart';
import 'package:kart_flutter/data/service/temporada_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ServicesDependecies {
  List<SingleChildWidget> get servicesRemote {
    return [
      Provider(create: (context) => HttpService()),
      Provider(create: (context) => LocalStorage()),
      Provider(
        create: (context) => TemporadaService(httpService: context.read()),
      ),
      Provider(create: (context) => PilotoService(httpService: context.read())),
      Provider(
        create: (context) => CorridaService(httpService: context.read()),
      ),
      Provider(
        create:
            (context) => LoginService(
              httpService: context.read(),
              localStorage: context.read(),
            ),
      ),
    ];
  }
}
