import 'package:connectivity_plus/connectivity_plus.dart';


class NetworkController {
  final Connectivity _connectivity = Connectivity();

  void initNetworkController() {
    _connectivity.onConnectivityChanged.listen((results) {
      for (var result in results) {
        _updateConnectionStatus(result);
      }
    });
  }

  Future<bool> checkConnection() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    }
    return true;
  }


  void _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      
      case ConnectivityResult.wifi:
        break;

      case ConnectivityResult.mobile:
        break;

      case ConnectivityResult.ethernet:
        break;

      case ConnectivityResult.vpn:
        break;

      case ConnectivityResult.none:
        break;

      default:
        break;
    }
  }
}