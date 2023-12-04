import 'package:reqres/src/data/repository/base/base_repository.dart';
import 'package:reqres/src/domain/repository/auth_repository.dart';

import '../../domain/model/body/auth_body.dart';
import '../../domain/model/response/auth_response.dart';
import '../../utils/resource/data_state.dart';
import '../data_source/reqres_api_service.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  final ReqresApiService _reqResApiService;

  AuthRepositoryImpl(this._reqResApiService);

  @override
  Future<DataState<String>> login(String email, String password) async {
    AuthBody authBody = AuthBody(email: email, password: password);
    DataState<AuthResponse> dataStateAuthResponse =
        await getStateOf<AuthResponse>(
      request: () => _reqResApiService.register(authBody),
    );

    if (dataStateAuthResponse is DataStateSuccess) {
      return DataStateSuccess(dataStateAuthResponse.data!.token!);
    } else if (dataStateAuthResponse is DataStateError) {
      return DataStateError(dataStateAuthResponse.exception!);
    } else {
      return DataStateError(Exception(
          'The Base Repository, Data State Loading error should never occur'));
    }
  }

  @override
  Future<DataState<String>> register(String email, String password) async {
    AuthBody authBody = AuthBody(email: email, password: password);
    DataState<AuthResponse> dataStateAuthResponse =
        await getStateOf<AuthResponse>(
      request: () => _reqResApiService.register(authBody),
    );

    if (dataStateAuthResponse is DataStateSuccess) {
      return DataStateSuccess(dataStateAuthResponse.data!.token!);
    } else if (dataStateAuthResponse is DataStateError) {
      return DataStateError(dataStateAuthResponse.exception!);
    } else {
      return DataStateError(Exception(
          'The Base Repository, Data State Loading error should never occur'));
    }
  }
}
