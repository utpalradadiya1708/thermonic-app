import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../../utils/helper/session_manager.dart';
import '../../../utils/logger_util.dart';
import '../../../utils/utils.dart';
import '../../theme/app_size_constants.dart';
import '../../theme/app_theme.dart';
import '../../theme/color_constants.dart';
import '../../theme/font_constants.dart';
import '../constants/app_constants.dart';
import '../constants/image_constants.dart';
import '../enum/image_selection_type.dart';
import 'common_button.dart';
import 'common_card.dart';

class CommonComponents {
  static bool _isSharing = false;
  static void commonBottomSheet({
    required Widget child,
    BoxDecoration? boxDecoration,
    EdgeInsetsGeometry? margin,
    bool? enableDrag,
  }) {
    Get.bottomSheet(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          width: Get.width,
          padding: EdgeInsets.all(AppSizeConstants.size_10),
          margin: margin,
          // margin: EdgeInsets.symmetric(horizontal: AppSizeConstants.size_15),
          decoration:
              boxDecoration ??
              BoxDecoration(
                color: ColorConstants.whiteColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    AppSizeConstants.size_26,
                  ), // Rounded top corners
                ),
              ),
          child: child,
        ),
      ),
      enableDrag: enableDrag ?? false,
      ignoreSafeArea: true,
      isDismissible: true,
      useRootNavigator: false,
      persistent: false,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.grey.withAlpha(20),
      enterBottomSheetDuration: Duration(milliseconds: 300),
      exitBottomSheetDuration: Duration(milliseconds: 300),
      isScrollControlled: true,
    );
  }

  static Future<void> shareCourseLink(
      String courseId,
      String courseName,
      ) async {
    final isArabic = Get.locale?.languageCode == 'ar';

    final userGradeData = await SessionManager.getUserGradeData();
    final gradeId = userGradeData['selected_grade'];
    final streamId = userGradeData['selected_stream'];

    // Auto-build path based on streamId
    late final String path;
    if (isArabic) {
      path = streamId != 0
          ? '/دورة/$gradeId/$streamId/$courseId/$courseName'
          : '/دورة/$gradeId/$courseId/$courseName';
    } else {
      path = streamId != 0
          ? '/course/$gradeId/$streamId/$courseId/$courseName'
          : '/course/$gradeId/$courseId/$courseName';
    }

    final link = generateDeepLink(path);
    print('🔗 Sharing course link: $link');
    shareSafely('lblCheckOutThis'.trParams({'value': link}));
  }

  static Future<void> shareChapterLink(
      String chapterId,
      String chapterName,
      ) async {
    final isArabic = Get.locale?.languageCode == 'ar';

    final userGradeData = await SessionManager.getUserGradeData();
    final gradeId = userGradeData['selected_grade'];
    final streamId = userGradeData['selected_stream'];

    late final String path;
    if (isArabic) {
      path = streamId != 0
          ? '/فصل/$gradeId/$streamId/$chapterId/$chapterName'
          : '/فصل/$gradeId/$chapterId/$chapterName';
    } else {
      path = streamId != 0
          ? '/chapter/$gradeId/$streamId/$chapterId/$chapterName'
          : '/chapter/$gradeId/$chapterId/$chapterName';
    }

    final link = generateDeepLink(path);
    print('🔗 Sharing chapter link: $link');
    shareSafely('lblCheckOutThis'.trParams({'value': link}));
  }


  static void shareExamLink(String examId) {
    final isArabic = Get.locale?.languageCode == 'ar';

    final path = isArabic ? '/امتحان/$examId' : '/exam/$examId';
    final link = generateDeepLink(path);

    print('🔗 Sharing exam link: $link');
    shareSafely('lblCheckOutThis'.trParams({'value': link}));
  }

  static Future<void> shareSafely(String text) async {
    if (_isSharing) return;
    _isSharing = true;

    try {
      // await SharePlus.instance.share(ShareParams(text: text));
    } catch (e) {
      print('❌ Error while sharing: $e');
    } finally {
      _isSharing = false;
    }
  }

  static String generateDeepLink(
      String path, {
        Map<String, String>? queryParams,
      }) {
    final uri = Uri.https('dev.sumgrads.com', path, queryParams);
    return uri.toString(); // Handles encoding automatically
  }

  static Color hexToColor(String hex) {
    if (hex.isEmpty) {
      return ColorConstants.primaryColor;
    }
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static displaySnackBarSuccess(String msg) {
    if (msg.trim().isEmpty) return;

    // Dismiss any open snackbars
    Get.closeAllSnackbars();

    MyLogger.write('we are showing snack with $msg');
    Get.snackbar(
      '',
      '',
      titleText: const SizedBox(height: 0),
      messageText: Text(
        msg,
        style: AppThemeState().textStyleSemiBold(
          ColorConstants.whiteColor,
          fontSize: FontConstants.font_14,
        ),
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      isDismissible: true,
      duration: const Duration(seconds: 2), // Auto-dismiss after 2 seconds
    );
  }

  static const LinearGradient primaryPurpleGradient = LinearGradient(
    colors: [ColorConstants.primaryColor, ColorConstants.secondaryColor],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static Widget gradientContainer(String text) {
    return Container(
      decoration: BoxDecoration(
        gradient: CommonComponents.primaryPurpleGradient,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(1),
      child: CommonCard(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        borderRadius: 8,
        borderColor: ColorConstants.transparentColor,
        child: Text(
          text,
          // '${'lblSemester'.tr} ${chapter.semesterId}',
          style: AppThemeState().textStyleRegular(ColorConstants.whiteColor),
        ),
      ),
    );
  }

  static displaySnackBarError(String msg) {
    if (msg.trim().isEmpty) return;

    // Dismiss any existing snackbars before showing a new one
    Get.closeAllSnackbars();

    MyLogger.write('we are showing snack with $msg');
    Get.snackbar(
      '',
      '',
      titleText: const SizedBox(height: 0),
      messageText: Text(
        msg.tr,
        style: AppThemeState().textStyleRegular(
          ColorConstants.whiteColor,
          fontSize: FontConstants.font_14,
        ),
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      isDismissible: true,
      duration: const Duration(seconds: 2), // Optional: dismiss after 3 seconds
    );
  }

  static void showChooseOptionForImage(
    String title, {
    required Function(String path) onImageSelect,
    bool isProfile = false,
  }) {
    Widget child = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title.tr,
          style: AppThemeState().textStyleRegular(
            ColorConstants.imagePickerColor,
            fontSize: FontConstants.font_16,
          ),
        ).marginSymmetric(vertical: AppSizeConstants.size_20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.back();
                selectImage(
                  type: ImageSelectionType.camera,
                  isProfile: isProfile,
                ).then((value) {
                  if (value != null) {
                    onImageSelect(value.path);
                  }
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppSizeConstants.size_16,
                      ),
                      color: ColorConstants.primaryColor,
                    ),
                    child: SvgPicture.asset(
                      ImageConstants.icCamera,
                      height: AppSizeConstants.size_32,
                      width: AppSizeConstants.size_32,
                    ).paddingAll(24),
                  ),
                  10.vBox,
                  Text(
                    "lblCamera".tr,
                    style: AppThemeState().textStyleRegular(
                      ColorConstants.blackTextColor,
                      fontSize: FontConstants.font_14,
                    ),
                  ),
                ],
              ),
            ),
            50.hBox,
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.back();
                selectImage(
                  type: ImageSelectionType.gallery,
                  isProfile: isProfile,
                ).then((value) {
                  if (value != null) {
                    onImageSelect(value.path);
                  }
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppSizeConstants.size_16,
                      ),
                      color: ColorConstants.primaryColor,
                    ),
                    child: SvgPicture.asset(
                      ImageConstants.icGallery,
                      height: AppSizeConstants.size_32,
                      width: AppSizeConstants.size_32,
                    ).paddingAll(24),
                  ),
                  10.vBox,
                  Text(
                    "lblGallery".tr,
                    style: AppThemeState().textStyleRegular(
                      ColorConstants.blackTextColor,
                      fontSize: FontConstants.font_14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        15.vBox,
      ],
    );
    commonBottomSheet(child: child);
  }

  static Future<DateTime?> commonDatePicker(
    String selectedDate, {
    DateTime? lastDate,
  }) async {
    return await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.isEmpty
          ? AppConstants.lastDate
          : stringToDateParsedMMMYYYY(selectedDate),
      lastDate: lastDate ?? AppConstants.lastDate,
      firstDate: AppConstants.firstDate,
      barrierDismissible: false,
      confirmText: 'lblSelect'.tr,
      useRootNavigator: true,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            useMaterial3: false,
            dialogTheme: DialogThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            colorScheme: ColorScheme.light(
              primary: ColorConstants.primaryColor,
              onPrimary: ColorConstants.whiteColor,
              onSurface: ColorConstants.secondaryColor,
            ),
          ),
          child: child!,
        );
      },
    );
  }

  static Widget getNetworkImageViewAPI(
    String? imageURL, {
    double? width,
    double? height,
    double? radius,
    BoxFit? boxFit,
    String? errorImage,
    bool isShowLoader = true,
  }) {
    if (imageURL == null || imageURL.isEmpty) {
      return Container(
        height: height ?? double.infinity,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 8),
          image: DecorationImage(
            image: AssetImage(errorImage ?? ImageConstants.isGuestUser),
            fit: boxFit ?? BoxFit.cover,
          ),
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: AppConstants.imagePath + imageURL,
      // matchTextDirection: true,
      fit: boxFit ?? BoxFit.cover,
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      cacheKey: AppConstants.imagePath + imageURL,
      imageBuilder: (context, imageProvider) => Container(
        height: height ?? double.infinity,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 8),
          image: DecorationImage(
            image: imageProvider,
            // matchTextDirection: true,
            fit: boxFit ?? BoxFit.cover,
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => isShowLoader
          ? Container(
              width: width ?? double.infinity,
              height: height ?? double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.zero,
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                color: ColorConstants.primaryColor,
              ),
            )
          : const SizedBox.shrink(),
      errorWidget: (context, url, error) => Container(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(errorImage ?? ImageConstants.isGuestUser),
            fit: boxFit ?? BoxFit.cover,
          ),
        ),
      ),
    );
  }

  static Widget getEmptyView({
    required String image,
    required String title,
    required String decryption,
    bool isShowButton = false,
    String buttonText = "",
    void Function()? onTap,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(image),
        Text(
          title,
          style: AppThemeState().textStyleBold(
            ColorConstants.blackTextColor,
            fontSize: FontConstants.font_18,
          ),
        ),
        Text(
          decryption,
          textAlign: TextAlign.center,
          style: AppThemeState().textStyleRegular(
            ColorConstants.textColor,
            fontSize: FontConstants.font_14,
          ),
        ),
        if (isShowButton) ...[
          SizedBox(height: AppSizeConstants.size_20),
          CommonButton(
            buttonText: buttonText,
            onTap: () {
              if (onTap != null) {
                onTap();
              }
            },
          ),
        ],
      ],
    );
  }

  static showFullDialogImage({String url = "", File? file}) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      useRootNavigator: false,
      useSafeArea: false,
      barrierColor: Colors.grey.withAlpha((255 * 0.8).round()),
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: AppSizeConstants.size_15,
          ),
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  ImageConstants.icCloseCircle,
                  height: AppSizeConstants.size_30,
                  colorFilter: ColorFilter.mode(
                    ColorConstants.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(height: AppSizeConstants.size_15),
              if (url.isNotEmpty) ...[
                getNetworkImageViewAPI(
                  url,
                  height: Get.height - AppSizeConstants.size_137,
                  width: Get.width,
                  boxFit: BoxFit.fill,
                ),
              ] else if (file != null) ...[
                if (file.path.split('.').last.toLowerCase() == 'pdf') ...[
                  // SizedBox(
                  //   height: Get.height - AppSizeConstants.size_130,
                  //   width: Get.width,
                  //   child: PDFView(
                  //     filePath: file.path,
                  //     fitPolicy: FitPolicy.BOTH,
                  //     onPageError: (page, error) {
                  //       debugPrint("Error loading PDF page: $error");
                  //     },
                  //   ),
                  // ),
                ] else ...[
                  Image.file(
                    file,
                    fit: BoxFit.fill,
                    height: Get.height - AppSizeConstants.size_130,
                    width: Get.width,
                  ),
                ],
              ],
            ],
          ),
        );
      },
    );
  }

  static Future<bool> commonDialog({
    required String title,
    String? subTitle,
    required String positiveText,
    required String negativeText,
    VoidCallback? onPositiveTap,
    VoidCallback? onNegativeTap,
  }) async {
    var result = await showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      useRootNavigator: true,
      useSafeArea: false,
      barrierColor: Colors.transparent,
      builder: (dialogContext) {
        return PopScope(
          canPop: false,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(color: Colors.black.withValues(alpha: 0.4)),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title.tr,
                        textAlign: TextAlign.center,
                        style: AppThemeState().textStyleMedium(
                          ColorConstants.blackTextColor,
                          fontSize: FontConstants.font_16,
                        ),
                      ),
                      16.vBox,
                      if (subTitle?.isNotEmpty ?? false) ...[
                        Text(
                          subTitle?.tr ?? '',
                          textAlign: TextAlign.center,
                          style: AppThemeState().textStyleMedium(
                            ColorConstants.greyColor,
                            fontSize: FontConstants.font_14,
                          ),
                        ),
                        24.vBox,
                      ],

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CommonButton(
                              buttonText: positiveText.tr,
                              onTap: () {
                                Get.back(result: true);
                                if (onPositiveTap != null) {
                                  onPositiveTap();
                                }
                              },
                              backgroundColor: ColorConstants.primaryColor,
                              textColor: Colors.white,
                            ),
                          ),
                          16.hBox,
                          Expanded(
                            child: CommonButton(
                              buttonText: negativeText.tr,
                              onTap: () {
                                Get.back(result: false);
                                if (onNegativeTap != null) {
                                  onNegativeTap();
                                }
                              },
                              backgroundColor: ColorConstants.whiteColor,
                              border: Border.all(
                                color: ColorConstants.primaryColor,
                              ),
                              textColor: ColorConstants.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    return result ?? false;
  }
}
