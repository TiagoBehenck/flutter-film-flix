import 'package:filme_flix/common/styles/theme/custom_theme.dart';
import 'package:filme_flix/common/navigation/routes.dart';
import 'package:filme_flix/common/infra/db/storage.dart';
import 'package:filme_flix/core/di/service_locator.dart';
import 'package:filme_flix/providers.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Storage.init();
  await configureDependencies();
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

