import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:reqres/src/config/router/guards/auth_guard.dart';
import 'package:reqres/src/presentation/views/home_screen.dart';

import '../../presentation/views/login_screen.dart';
import '../../presentation/views/register_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: RegisterRoute.page,
      path: RegisterScreen.routeName,
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: LoginScreen.routeName,
    ),
    AutoRoute(
      page: HomeRoute.page,
      path: HomeScreen.routeName,
      initial: true,
      guards: [
        AuthGuard(),
      ],
    ),
  ];
}

final appRouter = AppRouter();