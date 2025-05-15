// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:filme_flix/app/core/navigation/routes_constants.dart';

class NavBar extends StatefulWidget {
  const NavBar({required this.child, required this.index, super.key});
  final Widget child;
  final int index;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final List<String> _tabs = [
    RoutesConstants.home,
    RoutesConstants.search,
    '/favorites',
    '/settings',
  ];

  void changePage(int index) {
    final route = _tabs[index];

    if (!context.mounted) return;

    context.go(route, extra: index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: widget.child,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 6),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.index,
          onTap: (value) => changePage(value),
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: const Color(0xffBBBBBB),
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
