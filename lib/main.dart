import 'package:flutter/material.dart';
import 'package:kart_flutter/config/dependencies.dart';
import 'package:kart_flutter/ui/core/theme/app_theme.dart';
import 'package:kart_flutter/ui/home/home_page.dart';
import 'package:kart_flutter/ui/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HomeViewModel>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: HomePage(viewModel: viewModel),
    );
  }
}
