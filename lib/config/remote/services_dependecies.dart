import 'package:kart_flutter/data/service/client_http.dart';
import 'package:kart_flutter/data/service/local_storage.dart';
import 'package:kart_flutter/data/service/temporada_service.dart';
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
    ];
  }
}
