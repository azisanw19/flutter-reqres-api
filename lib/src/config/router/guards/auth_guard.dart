import 'package:auto_route/auto_route.dart';
import 'package:get/get.dart';
import 'package:reqres/src/config/router/app_router.dart';
import 'package:reqres/src/data/cache/cache.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    Cache cache = Get.find<Cache>();
    print("AuthGuard token ${cache.token}");

    if (cache.token.isEmpty) {
      router.push(LoginRoute());
    } else {
      resolver.next(true);
    }
  }

}