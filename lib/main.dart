import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thermonic/pages/splash/splash_bindings.dart';
import 'package:thermonic/utils/logger_util.dart';
import 'core/common/constants/app_constants.dart';
import 'core/common/constants/storage_keys.dart';
import 'core/common/repository/local_data/local_data_source.dart';
import 'core/common/repository/network_connectivity/connection_manager.dart';
import 'core/di/injector_container.dart';
import 'core/routes/app_pages.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/color_constants.dart';
import 'localization/locale_string.dart';
import 'localization/locate_controller.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

final LocaleController localeController = Get.put(LocaleController());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final connectionController = Get.put(ConnectionController());
  connectionController.initialiseNetworkManager();
  // await Firebase.initializeApp();
  // final deepLinkService = Get.put(DeepLinkService());
  // await deepLinkService.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await GetStorage.init(StorageKeys.cDataStore);
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await initializeDependencies();
  Get.put<LocalDataSource>(getIt<LocalDataSource>());

  configLoading();

  runApp(
    AppTheme(
      child: GetMaterialApp(
        // key: ValueKey(Get.locale),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        translations: LocaleString(),
        locale: Locale(localeController.currentLocale.value),
        fallbackLocale: const Locale('en', ''),
        supportedLocales: AppConstants.listLocale,
        textDirection: localeController.currentLocale.value == "en" ? TextDirection.ltr : TextDirection.rtl,
        title: 'Mafhoom',
        themeMode: ThemeMode.light,
        darkTheme: ThemeData(
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder(), TargetPlatform.iOS: CupertinoPageTransitionsBuilder()},
          ),
          primaryColor: ColorConstants.primaryColor,
          bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
        ),
        theme: ThemeData(
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder(), TargetPlatform.iOS: CupertinoPageTransitionsBuilder()},
          ),
          primaryColor: ColorConstants.primaryColor,
          bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
        ),
        useInheritedMediaQuery: false,
        debugShowCheckedModeBanner: false,
        logWriterCallback: MyLogger.write,
        initialBinding: SplashBindings(),
        initialRoute: AppPages.initialRoute,
        getPages: AppPages.routes,
        routingCallback: (value) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
          if (Platform.isIOS) {
            SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Colors.transparent, // optional
              ),
            );
          } else {
            SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor: ColorConstants.scaffoldBgColor,
                systemNavigationBarIconBrightness: Brightness.light,
              ),
            );
          }
        },
        builder: (context, child) {
          child = EasyLoading.init()(context, child);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child,
          );
        },
      ),
    ),
  );
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 3000)
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..indicatorSize = 60.0
    ..progressColor = ColorConstants.primaryColor
    ..backgroundColor = Colors.transparent
    ..indicatorColor = ColorConstants.whiteColor
    ..textColor = ColorConstants.whiteColor
    ..maskColor = Colors.black
        .withValues(alpha: 0.3) // Semi-transparent overlay
    ..userInteractions = false
    ..dismissOnTap = false;
}
