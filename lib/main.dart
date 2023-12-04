import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres/src/config/router/app_router.dart';
import 'package:reqres/src/config/themes/app_themes.dart';
import 'package:reqres/src/locator.dart';
import 'package:reqres/src/utils/constants/string.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  initializeDependencies();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: appTitle,

      /**
       * Settings Route
       */
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),

      /**
       * Settings Theme
       */
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}
