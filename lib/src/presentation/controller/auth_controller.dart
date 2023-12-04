import 'package:get/get.dart';
import 'package:reqres/src/data/cache/cache.dart';
import 'package:reqres/src/domain/repository/auth_repository.dart';
import 'package:reqres/src/utils/resource/data_state.dart';

import '../state/auth_state.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = Get.find<AuthRepository>();
  final Cache _cache = Get.find<Cache>();
  final Rx<AuthState> _authState = Rx<AuthState>(AuthStateNoting());
  final RxBool _isValidEmail = RxBool(false);
  final RxBool _isValidPassword = RxBool(false);

  String _email = '';

  set email(String email) => _email = email;

  set isValidEmail(bool isValidEmail) => _isValidEmail.value = isValidEmail;

  String _password = '';

  set password(String password) => _password = password;

  set isValidPassword(bool isValidPassword) =>
      _isValidPassword.value = isValidPassword;

  AuthState get authState => _authState.value;
  bool get isValidFields => _isValidEmail.value && _isValidPassword.value;

  Future<void> signInWithEmailAndPassword() async {
    _authState.value = const AuthState.loading();
    DataState<String> dataStateToken =
        await _authRepository.login(_email, _password);

    if (dataStateToken is DataStateSuccess) {
      _cache.token = dataStateToken.data!;
      _authState.value = const AuthState.authenticated();
    } else if (dataStateToken is DataStateError) {
      _authState.value =
          AuthState.unauthenticated(dataStateToken.exception.toString());
    }
  }

  Future<void> signUpWithEmailAndPassword() async {
    _authState.value = const AuthState.loading();
    DataState<String> dataStateToken =
        await _authRepository.register(_email, _password);

    if (dataStateToken is DataStateSuccess) {
      _cache.token = dataStateToken.data!;
      _authState.value = AuthState.authenticated();
    } else if (dataStateToken is DataStateError) {
      _authState.value =
          AuthState.unauthenticated(dataStateToken.exception.toString());
    }
  }

  void signOut() {
    _cache.clearCache();
    _authState.value = AuthState.unauthenticated('Successfully signed out');
  }
}
