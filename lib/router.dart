import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_example/settings_page.dart';

class Router {
  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
        const SettingsPage(),
      ),
    ],
  );
}
