import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final isOffline = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnectivity();

    // Listen to connection changes
    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> resultList,
    ) {
      final offline = resultList.every((r) => r == ConnectivityResult.none);
      isOffline.value = offline;

      print('🔄 Connectivity changed: $resultList');
      print('📶 Device is ${offline ? "OFFLINE" : "ONLINE"}');
    });
  }

  void _checkInitialConnectivity() async {
    final List<ConnectivityResult> resultList = await Connectivity()
        .checkConnectivity();
    final offline = resultList.every((r) => r == ConnectivityResult.none);
    isOffline.value = offline;

    print('🚀 Initial connectivity: $resultList');
    print('📶 Device is initially ${offline ? "OFFLINE" : "ONLINE"}');
  }
}
