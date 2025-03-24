import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkController {
  final Connectivity _connectivity = Connectivity();

  /// Listen to the network connectivity changes and update the connection status
  /// accordingly. It shows a toast message to the user about the connection type
  /// (e.g. wifi, mobile, ethernet, vpn).
  void initNetworkController() {
    _connectivity.onConnectivityChanged.listen((results) {
      for (var result in results) {
        _updateConnectionStatus(result);
      }
    });
  }

  /// Checks if the device has an internet connection.
  ///
  /// If the device is not connected to the internet, it shows an error toast
  /// message to the user with the message 'لا يوجد اتصال بالانترنت'. This
  /// method returns a boolean value indicating whether the device is connected
  /// or not. If the device is connected to the internet, the method returns
  /// [true], otherwise it returns [false].
  Future<bool> checkConnection() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    }
    return true;
  }

  /// Updates the connection status based on the given [ConnectivityResult]. It
  /// shows a toast message to the user about the connection type (e.g. wifi,
  /// mobile, ethernet, vpn). If the device is not connected to the internet, it
  /// shows an error toast message to the user with the message 'لا يوجد اتصال
  /// بالانترنت'.
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
        // AppToast.showErrorToast('لا يوجد اتصال بالانترنت');
        break;

      default:
        break;
    }
  }
}
