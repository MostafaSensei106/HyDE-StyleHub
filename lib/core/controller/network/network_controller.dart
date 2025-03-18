import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:tadamon/core/widgets/app_toast/app_toast.dart';
import 'package:tadamon/features/report_products/logic/services/report_service.dart';

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
        await ReportService.resendPendingReports();
        break;

      case ConnectivityResult.mobile:
        await ReportService.resendPendingReports();
        break;

      case ConnectivityResult.ethernet:
        await ReportService.resendPendingReports();
        break;

      case ConnectivityResult.vpn:
                await ReportService.resendPendingReports();
        break;

      case ConnectivityResult.none:
        break;

      default:
        break;
    }
  }
}