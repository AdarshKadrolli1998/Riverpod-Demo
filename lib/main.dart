import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_example/riverpod_demo.dart';
import 'package:riverpod_example/settings_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'icon_db_model.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(IconDbModelAdapter());
  await Hive.openBox<IconDbModel>('IconDbModel');

  runApp( ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>
   MaterialApp.router(
     // routeInformationProvider: _router.,
     routeInformationParser: _router.routeInformationParser,
     routerDelegate: _router.routerDelegate,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: const ProviderScope(child: RiverPodDemo(),),
    );

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
        const RiverPodDemo(),
      ),
      GoRoute(
        path: '/settings',
        builder: (BuildContext context, GoRouterState state) =>
        const SettingsPage(),
      ),
    ],
  );
}

