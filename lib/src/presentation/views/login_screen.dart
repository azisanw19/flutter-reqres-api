import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres/src/config/router/app_router.dart';
import 'package:reqres/src/presentation/components/reqres_text_from_field.dart';
import 'package:reqres/src/presentation/controller/auth_controller.dart';
import 'package:reqres/src/utils/constants/regex.dart';

import '../state/auth_state.dart';

@RoutePage()
// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';
  late AuthController _authController;

  @override
  Widget build(BuildContext context) {
    _authController = AuthController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Reqres'),
      ),
      body: _bodyLogin(context),
    );
  }

  Widget _bodyLogin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'Login Reqres',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 32),
            ReqresTextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              valueValidator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                }
                if (!emailRegex.hasMatch(value)) {
                  return 'Email is invalid';
                }

                return null;
              },
              isValidChanged: (isValid) {
                _authController.isValidEmail = isValid ?? false;
              },
              valueChanged: (value) {
                _authController.email = value;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            ReqresTextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              valueValidator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                } else {
                  return null;
                }
              },
              isValidChanged: (isValid) {
                _authController.isValidPassword = isValid ?? false;
              },
              valueChanged: (value) {
                _authController.password = value;
              },
              obscureText: true,
            ),
            const SizedBox(height: 32),
            Obx(
              () => ElevatedButton(
                onPressed: _loginOnPressed(_authController),
                child: const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Spacer(),
                    Text('Login'),
                    Spacer(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                context.router.push(RegisterRoute());
              },
              child: const Text('Register?'),
            ),
            Obx(() {
              if (_authController.authState is AuthStateLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (_authController.authState is AuthStateAuthenticated) {
                context.router.replaceAll([HomeRoute()]);
              } else if (_authController.authState
                  is AuthStateUnauthenticated) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _showSnackBar(
                      context,
                      (_authController.authState as AuthStateUnauthenticated)
                          .message);
                });
              }
              return const SizedBox.shrink();
            })
          ],
        ),
      ),
    );
  }

  Function()? _loginOnPressed(AuthController authController) {
    if (authController.isValidFields) {
      return () {
        authController.signInWithEmailAndPassword();
      };
    } else {
      return null;
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
