import 'package:reqres/src/domain/model/response/user.dart';

import '../../utils/resource/data_state.dart';

abstract class UserRepository {
  Future<DataState<List<User>>> getUsers(int page);
}