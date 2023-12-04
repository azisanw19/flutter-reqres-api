import 'package:get_storage/get_storage.dart';

class Cache {
  /// Singleton instance
  static final Cache _instance = Cache._internal();

  factory Cache() {
    return _instance;
  }

  Cache._internal();

  final GetStorage _getStorage = GetStorage();

  set token(String token) {
    _getStorage.write('token', token);
  }

  String get token {
    return _getStorage.read<String?>('token') ?? "";
  }

  void clearCache() {
    _getStorage.erase();
  }
}
