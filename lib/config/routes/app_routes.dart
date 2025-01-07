import 'package:flutter/material.dart';
import 'package:flutter_timbus_annotations/presentation/shared/barrels/screens.dart';
import 'package:go_router/go_router.dart';

final appRoutes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: '/rules',
      pageBuilder: (_, __) => _transitionPage(const RulesScreen()),
    ),
    GoRoute(
      path: '/settings',
      pageBuilder: (_, __) => _transitionPage(const SettingsScreen()),
    ),

    GoRoute(
      path: '/mosca',
      pageBuilder: (_, __) => _transitionPage(const MoscaScreen()),
    ),
    GoRoute(
      path: '/truco',
      pageBuilder: (_, __) => _transitionPage(const TrucoScreen()),
    ),
    GoRoute(
      path: '/chinchon',
      pageBuilder: (_, __) => _transitionPage(const ChinchonScreen()),
    ),
    GoRoute(
      path: '/generala',
      pageBuilder: (_, __) => _transitionPage(const GeneralaScreen()),
    ),

  ],
);

CustomTransitionPage _transitionPage(Widget myChild) {
  return CustomTransitionPage(
    child: myChild,
    transitionDuration: const Duration(milliseconds: 150),
    reverseTransitionDuration: const Duration(milliseconds: 100),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curve = CurvedAnimation(parent: animation, curve: Curves.linear);

      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(curve),
        child: child,
      );
    },
  );
}
