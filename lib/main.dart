import 'package:filme_flix/common/styles/theme/custom_theme.dart';
import 'package:filme_flix/core/navigation/routes.dart';
import 'package:filme_flix/infra/db/storage.dart';
import 'package:filme_flix/providers.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Storage.init();
  runApp(
    providers(
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.theme,
      routerConfig: router,
    );
  }
}

