import 'package:reqres/src/domain/model/response/user.dart';

class HomeState {
  const HomeState._();

  const factory HomeState.nothing() = HomeStateNoting;

  const factory HomeState.users(List<User> users) = HomeStateUsers;

  const factory HomeState.error(String message) = HomeStateError;
}

class HomeStateNoting extends HomeState {
  const HomeStateNoting() : super._();
}

class HomeStateUsers extends HomeState {
  const HomeStateUsers(this.users) : super._();

  final List<User> users;
}

class HomeStateError extends HomeState {
  const HomeStateError(this.message) : super._();

  final String message;
}