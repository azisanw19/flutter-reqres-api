import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'connectivity_manager_impl.dart';

class ConnectivityManager implements ConnectivityManagerImpl {

  final Connectivity connectivity = Connectivity();

  @override
  Stream<bool> get watchIsOnline => connectivity.onConnectivityChanged.map(_internetCheck);

  @override
  Future<bool> get isOnline async => _internetCheck(await connectivity.checkConnectivity());

  bool _internetCheck(ConnectivityResult connectivityResult) {
    switch(connectivityResult) {
      case ConnectivityResult.mobile: {
        return true;
      }
      case ConnectivityResult.wifi: {
        return true;
      }
      default: {
        return false;
      }
    }
  }

}
