import '../../utils/resource/data_state.dart';

abstract class AuthRepository {
  // token
  Future<DataState<String>> register(String email, String password);
  // token
  Future<DataState<String>> login(String email, String password);
}