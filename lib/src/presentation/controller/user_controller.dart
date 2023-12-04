import 'package:get/get.dart';
import 'package:reqres/src/domain/model/response/user.dart';
import 'package:reqres/src/presentation/state/home_state.dart';
import 'package:reqres/src/utils/resource/data_state.dart';

import '../../domain/repository/user_repository.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = Get.find<UserRepository>();
  final Rx<HomeState> _homeState = Rx<HomeState>(HomeState.nothing());
  List<User> _users = [];

  HomeState get homeState => _homeState.value;

  @override
  void onInit() {
    super.onInit();
  }

  void getUsers(int page) async {
    DataState<List<User>> dataStateUsers = await _userRepository.getUsers(page);

    if (dataStateUsers is DataStateSuccess) {
      _users.addAll(dataStateUsers.data!);
      _homeState.value = HomeState.users(_users);
    } else if (dataStateUsers is DataStateError) {
      _homeState.value = HomeState.error(dataStateUsers.exception.toString());
    }
  }
}
