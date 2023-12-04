import 'dart:async';

abstract class ConnectivityManagerImpl {

  Stream<bool> get watchIsOnline;

  Future<bool> get isOnline;

}