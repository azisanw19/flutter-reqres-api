import 'package:reqres/src/data/repository/base/base_repository.dart';
import 'package:reqres/src/domain/model/response/list_user_response.dart';
import 'package:reqres/src/domain/model/response/user.dart';
import 'package:reqres/src/utils/resource/data_state.dart';

import '../../domain/repository/user_repository.dart';
import '../data_source/reqres_api_service.dart';

class UserRepositoryImpl extends BaseRepository implements UserRepository {
  final ReqresApiService _reqResApiService;

  UserRepositoryImpl(this._reqResApiService);

  @override
  Future<DataState<List<User>>> getUsers(int page) async {
    DataState<ListUserResponse> dataStateUsers = await getStateOf<ListUserResponse>(
      request: () => _reqResApiService.getUsers(page),
    );

    if (dataStateUsers is DataStateSuccess) {
      return DataStateSuccess(dataStateUsers.data!.data!);
    } else if (dataStateUsers is DataStateError) {
      return DataStateError(dataStateUsers.exception!);
    } else {
      return DataStateError(Exception(
          'The Base Repository, Data State Loading error should never occur'));
    }
  }

}
