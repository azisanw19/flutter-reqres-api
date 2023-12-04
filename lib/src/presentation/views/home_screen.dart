import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres/src/domain/model/response/user.dart';
import 'package:reqres/src/presentation/components/reqres_list_view.dart';
import 'package:reqres/src/presentation/controller/auth_controller.dart';
import 'package:reqres/src/presentation/controller/user_controller.dart';
import 'package:reqres/src/presentation/state/home_state.dart';

import '../../config/router/app_router.dart';

@RoutePage()
// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';
  late AuthController _authController;
  late UserController _userController;

  @override
  Widget build(BuildContext context) {
    _authController = AuthController();
    _userController = UserController();
    _userController.getUsers(1);
    _userController.getUsers(2);
    _userController.getUsers(3);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              _authController.signOut();
              context.router.replaceAll([LoginRoute()]);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: _bodyHome(context),
    );
  }

  Widget _bodyHome(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Obx(
        () {
          if (_userController.homeState is HomeStateError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showSnackBar(context,
                  (_userController.homeState as HomeStateError).message);
            });
          } else if (_userController.homeState is HomeStateUsers) {
            List<User> users =
                (_userController.homeState as HomeStateUsers).users;

            return ReqresListViewPagination(
              itemCount: users.length,
              firstPage: 3,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(users[index].firstName ?? ""),
                  subtitle: Text(users[index].email ?? ""),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(users[index].avatar ?? ""),
                  ),
                );
              },
              onPageChanged: (int page) {
                _userController.getUsers(page);
                print("page $page");
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
