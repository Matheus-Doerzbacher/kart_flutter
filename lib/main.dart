import 'package:flutter/material.dart';
import 'package:kart_flutter/config/dependencies.dart';
import 'package:kart_flutter/routing/router.dart';
import 'package:kart_flutter/ui/core/theme/app_theme.dart';
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
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      routerConfig: appRouter(),
    );
  }
}
