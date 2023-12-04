sealed class AuthState {
  const AuthState._();

  const factory AuthState.loading() = AuthStateLoading;

  const factory AuthState.authenticated() = AuthStateAuthenticated;

  const factory AuthState.unauthenticated(String message) = AuthStateUnauthenticated;
}

class AuthStateNoting extends AuthState {
  const AuthStateNoting() : super._();
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading() : super._();
}

class AuthStateAuthenticated extends AuthState {
  const AuthStateAuthenticated() : super._();
}

class AuthStateUnauthenticated extends AuthState {
  const AuthStateUnauthenticated(this.message) : super._();

  final String message;
}