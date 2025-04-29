// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kart_flutter/data/service/client_http.dart';
import 'package:kart_flutter/domain/models/piloto/piloto.dart';
import 'package:kart_flutter/ui/home/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel viewModel = HomeViewModel();
  List<Piloto>? value;

  @override
  void initState() {
    super.initState();
    final http = ClientHttp();
    http
        .get('/pilotos')
        .then((result) {
          result.fold((responseBody) {
            final data = jsonDecode(responseBody) as List<dynamic>;
            print(data);
            setState(() {
              value = data.map((e) => Piloto.fromJson(e)).toList();
            });
            print(value);
          }, print);
        })
        // ignore: invalid_return_type_for_catch_error
        .catchError(print);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ListView.builder(
          itemCount: value?.length ?? 0,
          itemBuilder:
              (context, index) => Text(value?[index].toString() ?? 'Teste'),
        ),
      ),
    );
  }
}
