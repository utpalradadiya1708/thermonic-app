import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/logger_util.dart';

///
/// This class checks if device has internet connectivity or not
///

@LazySingleton(as: ConnectionController)
class ConnectionController extends GetxService {
  final onInternetConnected = true.obs;

  Stream<bool?> get internetConnectionStream => onInternetConnected.stream;

  Connectivity connectivity = Connectivity();

  bool? _isInternetConnected;

  Timer? _debounce;

  /*@override
  void onInit() {
    print("object=============>>>>>>>>ConnectionController");
    try {
      initialiseNetworkManager();
    } catch (e) {
      MyLogger.write("$e");
    }
    super.onInit();
  }*/

  initialiseNetworkManager() async {
    List<ConnectivityResult> result = await connectivity.checkConnectivity();
    _checkStatus(result.first);

    connectivity.onConnectivityChanged.listen((resultList) {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(Duration(milliseconds: 500), () {
        MyLogger.write('connection change $resultList');
        _checkStatus(resultList.first);
      });
    });
  }

  Future<bool> isConnected() async {
    List<ConnectivityResult> result = await connectivity.checkConnectivity();
    return await _checkStatus(result.first);
  }

  Future<bool> _checkStatus(ConnectivityResult result) async {
    bool? isInternet = false;
    switch (result) {
      case ConnectivityResult.wifi:
        isInternet = true;
        break;
      case ConnectivityResult.mobile:
        isInternet = true;
        break;
      case ConnectivityResult.ethernet:
        isInternet = true;
        break;
      case ConnectivityResult.none:
        isInternet = false;
        break;
      default:
        isInternet = false;
        break;
    }
    // if (isInternet) isInternet = await _updateConnectionStatus();
    if (_isInternetConnected == null || _isInternetConnected != isInternet) {
      _isInternetConnected = isInternet;
      onInternetConnected.value = isInternet;

      if (!onInternetConnected.value) {
        print('onInternetConnected value changed ${onInternetConnected.value}');
        // CommonComponents.displaySnackBarError(
        //   "Please check your Internet connection.",
        // );
      } else {}
    }
    MyLogger.write('internet change to $isInternet');
    return isInternet;
  }

  /*@override
  void onClose() {
    onInternetConnected.close();
    super.onClose();
  }*/
}
