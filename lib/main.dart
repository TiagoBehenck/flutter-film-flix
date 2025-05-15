// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:filme_flix/app/common/infra/db/storage.dart';
import 'package:filme_flix/app/common/providers/providers.dart';
import 'package:filme_flix/app/common/styles/theme/custom_theme.dart';
import 'package:filme_flix/app/core/di/service_locator.dart';
import 'package:filme_flix/app/core/navigation/routes.dart';

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

