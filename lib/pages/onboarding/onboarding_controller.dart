import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/common/constants/storage_keys.dart';
import '../../core/common/repository/local_data/local_data_source.dart';
import '../../core/di/injector_container.dart';
import '../../core/routes/app_pages.dart';

class OnBoardingController extends GetxController {
  LocalDataSource localDataSource = getIt<LocalDataSource>();
  final pageController = PageController(initialPage: 0).obs;
  final currentPage = 0.obs;

  Future<void> nextScreen() async {
    await localDataSource.setData(StorageKeys.cKeyIsOnBoardingDone, true);
    Get.offNamed(Routes.login);
  }
}
