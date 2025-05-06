import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kart_flutter/routing/routes.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

  final tabs = [
    {'icon': Icons.home, 'route': Routes.home, 'label': 'Home'},
    {'icon': Icons.people, 'route': Routes.pilotos, 'label': 'Pilotos'},
    {'icon': Icons.flag, 'route': Routes.corridas, 'label': 'Corridas'},
    {'icon': Icons.map, 'route': Routes.pistas, 'label': 'Pistas'},
  ];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Colors.grey,
      currentIndex: _calculateSelectedIndex(location),
      onTap: (index) {
        context.goNamed(tabs[index]['route']! as String);
      },
      items:
          tabs
              .map(
                (tab) => BottomNavigationBarItem(
                  icon: Icon(tab['icon']! as IconData),
                  label: tab['label']! as String,
                ),
              )
              .toList(),
    );
  }

  int _calculateSelectedIndex(String location) {
    final routePath = location.isEmpty ? '/' : location;

    if (routePath == Routes.home) {
      return 0;
    } else if (routePath == '/${Routes.pilotos}') {
      return 1;
    } else if (routePath == '/${Routes.corridas}') {
      return 2;
    } else if (routePath == '/${Routes.pistas}') {
      return 3;
    }
    return 0;
  }
}
