/*
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thermonic/pages/notification/notification_counter_controller.dart';
import 'package:thermonic/utils/widget_extensions.dart';
import 'package:marquee/marquee.dart';

import '../../core/common/constants/app_constants.dart';
import '../../core/common/constants/image_constants.dart';
import '../../core/common/enum/grade_selection_enum.dart';
import '../../core/common/repository/local_data/local_data_source.dart';
import '../../core/common/repository/network_connectivity/connection_manager.dart';
import '../../core/common/widget/common_components.dart';
import '../../core/common/widget/common_exam_card.dart';
import '../../core/common/widget/common_header_widget.dart';
import '../../core/common/widget/common_textform_field.dart';
import '../../core/common/widget/common_white_circle_with_center_icon.dart';
import '../../core/common/widget/course_package_grid.dart';
import '../../core/common/widget/drop_down/dropdown_button2.dart';
import '../../core/common/widget/no_data_widget.dart';
import '../../core/common/widget/no_internet_widget.dart';
import '../../core/common/widget/shimmer_effect.dart';
import '../../core/di/injector_container.dart';
import '../../core/routes/app_pages.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/color_constants.dart';
import '../../core/theme/font_constants.dart';
import '../../models/subject_model_response/subject_model_response.dart';
import '../../models/user_model_response/user_model_response.dart';
import '../../utils/helper/session_manager.dart';
import '../profile_setup/profile_setup_controller.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final localDataSource = getIt<LocalDataSource>();

  final connectionController = Get.find<ConnectionController>();

  final profileSetupController = ProfileSetupController();

  final notificationCounterController = Get.find<NotificationCounterController>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await profileSetupController.completeProfileSetup(isRefresh: true);
        await controller.refreshUser();
        final offset = controller.scrollController.offset;
        await controller.getHomeData();
        controller.scrollController.jumpTo(offset);
      },
      color: ColorConstants.primaryColor,
      child: Obx(() {
        if (!connectionController.onInternetConnected.value) {
          return Center(child: NoInternetWidget()); // or your full offline screen
        }
        return SingleChildScrollView(
          controller: controller.scrollController,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Loading shimmer
                if (controller.isShimmerShow.value)
                  shimmerView()
                // ✅ No data fallback
                else if (controller.hasApiFailed.value)
                  // Center(child: Text('no data'))
                  Center(child: NoDataWidget())
                // ✅ Actual content
                else
                  _buildUI(),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildGradeDropdownRow({
    required List<GradeModel> gradeItems,
    required GradeSelectionType selectionType,
    required void Function(int) onTap,
  }) {
    return Column(
      children: [
        Obx(() {
          print('gradeItems $gradeItems');

          if (gradeItems.isEmpty) {
            return Text('No grades available', style: AppThemeState().textStyleRegular(ColorConstants.whiteColor));
          }

          final selectedGradeId = controller.selectedGrade.value;

          /// Safely find selected grade (null if not in list)
          final selectedGrade = gradeItems.firstWhere((grade) => grade.id == selectedGradeId, orElse: () => GradeModel(id: null, name: ''));

          /// Safely assign dropdown value only if it exists in gradeItems
          final dropdownValue = gradeItems.any((g) => g.id == selectedGradeId) ? selectedGradeId : null;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'lblSelectedGrade'.tr,
                style: AppThemeState().textStyleRegular(ColorConstants.whiteColor, fontSize: FontConstants.font_16),
              ),
              Spacer(),
              IntrinsicWidth(
                child: DropdownButtonFormField2<int>(
                  isExpanded: false,
                  value: dropdownValue,
                  selectedValue: SizedBox(
                    width: 150,
                    child: Text(
                      selectedGrade.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: AppThemeState().textStyleRegular(ColorConstants.whiteColor, fontSize: FontConstants.font_14),
                    ),
                  ),
                  itemList: gradeItems.map((grade) => grade.id ?? 0).toList(),
                  items: gradeItems.map((grade) {
                    return DropdownMenuItem<int>(
                      value: grade.id ?? 0,
                      child: Text(
                        grade.name ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppThemeState().textStyleRegular(ColorConstants.blackColor, fontSize: FontConstants.font_14),
                      ),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      onTap(newValue);
                    }
                  },
                  style: AppThemeState().textStyleRegular(ColorConstants.whiteColor, fontSize: FontConstants.font_14),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    suffixIcon: Icon(Icons.arrow_drop_down, size: 20, color: ColorConstants.whiteColor),
                    suffixIconConstraints: const BoxConstraints(minWidth: 20),
                    isDense: true,
                  ),
                  buttonStyleData: const ButtonStyleData(padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0)),
                  dropdownStyleData: DropdownStyleData(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12))),
                  menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.symmetric(horizontal: 12)),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  Widget buildStreamDropdownRow({required List<StreamModel> streamOptions, required RxnInt selectedStreamId, void Function(int)? onTap}) {
    return Obx(() {
      final int? selectedId = selectedStreamId.value;

      final selectedStream = streamOptions.firstWhereOrNull((s) => s.id == selectedId);

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('lblSelectedStream'.tr, style: AppThemeState().textStyleRegular(ColorConstants.whiteColor, fontSize: FontConstants.font_16)),
          // const SizedBox(width: 12),
          Spacer(),
          IntrinsicWidth(
            child: DropdownButtonFormField2<int>(
              isExpanded: false, // allow width to match content
              key: ValueKey(selectedId),
              value: streamOptions.any((s) => s.id == selectedId) ? selectedId : null,
              selectedValue: SizedBox(
                width: 150, // optional: cap width if text can be very long
                child: Text(
                  selectedStream?.name ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: AppThemeState().textStyleRegular(ColorConstants.whiteColor, fontSize: FontConstants.font_14),
                ),
              ),
              style: AppThemeState().textStyleRegular(ColorConstants.whiteColor, fontSize: FontConstants.font_14),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                suffixIcon: Icon(Icons.arrow_drop_down, size: 20, color: ColorConstants.whiteColor),
                suffixIconConstraints: const BoxConstraints(minWidth: 20),
                isDense: true,
              ),
              items: streamOptions.map((stream) {
                return DropdownMenuItem<int>(
                  value: stream.id ?? 0,
                  child: Text(
                    stream.name ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppThemeState().textStyleRegular(ColorConstants.blackColor, fontSize: FontConstants.font_14),
                  ),
                );
              }).toList(),
              onChanged: (int? newValue) {
                if (newValue != null) {
                  onTap?.call(newValue);
                }
              },
              dropdownStyleData: DropdownStyleData(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12))),
              menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.symmetric(horizontal: 12)),
              itemList: streamOptions.map((s) => s.id ?? 0).toList(),
            ),
          ),
        ],
      );
    });
  }

  Widget shimmerView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          16.vBox,

          // Header Profile Section Shimmer
          _buildHeaderShimmer().paddingSymmetric(horizontal: 16),

          16.vBox,

          // Search Bar Shimmer
          _buildSearchBarShimmer().paddingSymmetric(horizontal: 16),

          16.vBox,

          // Marquee Banner Shimmer
          _buildMarqueeShimmer().paddingSymmetric(horizontal: 16),

          16.vBox,

          // Continue Learning Section Shimmer
          _buildContinueLearningShimmer(),

          16.vBox,

          // Grade Dropdown Shimmer
          _buildGradeDropdownShimmer().paddingSymmetric(horizontal: 16),

          16.vBox,

          // Stream Dropdown Shimmer (conditional)
          // _buildStreamDropdownShimmer().paddingSymmetric(horizontal: 16),

          // 16.vBox,

          // Exam Package Section Shimmer
          _buildExamPackageShimmer(),

          16.vBox,

          // Course Package Section Shimmer
          _buildCoursePackageShimmer(),

          20.vBox,
        ],
      ),
    );
  }

  Widget _buildHeaderShimmer() {
    return Row(
      children: [
        // Profile Image Shimmer
        ShimmerEffect(width: 48, height: 48, borderRadius: 12),
        9.hBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerEffect(width: 120, height: 10, borderRadius: 4),
              10.vBox,
              ShimmerEffect(width: 80, height: 10, borderRadius: 4),
            ],
          ),
        ),
        Spacer(),
        // Notification Icon Shimmer
        ShimmerEffect(width: 48, height: 48, borderRadius: 12),
      ],
    );
  }

  Widget _buildSearchBarShimmer() {
    return ShimmerEffect(width: double.infinity, height: 45, borderRadius: 12);
  }

  Widget _buildMarqueeShimmer() {
    return ShimmerEffect(width: double.infinity, height: 40, borderRadius: 6);
  }

  Widget _buildContinueLearningShimmer() {
    return Column(
      children: [
        // Header Shimmer
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ShimmerEffect(width: 160, height: 14, borderRadius: 4), ShimmerEffect(width: 60, height: 14, borderRadius: 4)],
          ),
        ),
        14.vBox,

        // Course Cards Shimmer
        Padding(
          padding: EdgeInsetsDirectional.only(start: 16),
          child: SizedBox(
            height: 115,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(end: 12),
                  child: ShimmerEffect(width: MediaQuery.of(context).size.width * 0.9, height: 115, borderRadius: 14),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGradeDropdownShimmer() {
    return ShimmerEffect(width: double.infinity, height: 35, borderRadius: 8);
  }

  Widget _buildExamPackageShimmer() {
    return Column(
      children: [
        // Header Shimmer
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ShimmerEffect(width: 120, height: 14, borderRadius: 4), ShimmerEffect(width: 60, height: 14, borderRadius: 4)],
          ),
        ),
        14.vBox,

        // Horizontal List Shimmer
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: SizedBox(
            height: 84,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => 12.hBox,
              itemCount: 4,
              itemBuilder: (context, index) {
                return ShimmerEffect(width: 190, height: 84, borderRadius: 10);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCoursePackageShimmer() {
    return Column(
      children: [
        // Header Shimmer
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ShimmerEffect(width: 120, height: 14, borderRadius: 4), ShimmerEffect(width: 60, height: 14, borderRadius: 4)],
          ),
        ),
        14.vBox,

        // Course Package Grid Shimmer
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(end: 12),
                  child: ShimmerEffect(width: 165, height: 180, borderRadius: 12),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.vBox,
        Obx(() {
          final user = controller.user.value;
          final isGuest = controller.isGuest.value;
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12),
                child: isGuest
                    ? Image.asset(ImageConstants.isGuestUser, width: 48, height: 48)
                    : CommonComponents.getNetworkImageViewAPI((user?.user.profilePictureFullUrl), height: 48, width: 48),
              ),
              9.hBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isGuest ? 'guest'.tr : 'welcomeBack'.tr,
                      style: AppThemeState().textStyleRegular(ColorConstants.greyColor, fontSize: 14),
                    ),
                    Text(
                      isGuest ? 'pleaseLoginToAccessAccount'.tr : user?.user.name ?? 'lblDummyUser'.tr,
                      maxLines: 2,
                      style: AppThemeState().textStyleRegular(ColorConstants.whiteColor, fontSize: 16),
                    ).onTap(() {
                      isGuest ? Get.offAllNamed(Routes.login) : null;
                    }),
                  ],
                ),
              ),
              Spacer(),
              isGuest
                  ? SizedBox.shrink()
                  : CommonWhiteCircleWithCenterIcon(
                      height: 48,
                      width: 48,
                      borderColor: ColorConstants.borderColor.withValues(alpha: 0.20),
                      onTap: () async {
                        if (!await SessionManager.requireLoginForFeature()) {
                          return;
                        } else {
                          Get.toNamed(Routes.notification);
                        }
                      },
                      borderRadius: 12,
                      child: Center(
                        child: Stack(
                          children: [
                            SvgPicture.asset(ImageConstants.icNotification),
                            Obx(() {
                              final count = notificationCounterController.notificationCount.value;
                              return count > 0
                                  ? Positioned(
                                      right: 0,
                                      child: Container(
                                        height: 14,
                                        width: 14,
                                        padding: const EdgeInsets.symmetric(horizontal: 2),
                                        decoration: BoxDecoration(
                                          color: ColorConstants.primaryColor,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: FittedBox(
                                            child: Text(
                                              count.toString(),
                                              style: AppThemeState().textStyleRegular(ColorConstants.whiteColor, fontSize: 8),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox.shrink();
                            }),
                          ],
                        ),
                      ),
                    ),
            ],
          );
        }).paddingSymmetric(horizontal: 16),
        16.vBox,
        Row(
          children: [
            Expanded(
              child: Obx(
                () => CommonTextFormField(
                  readOnly: true,
                  onTap: () {
                    Get.toNamed(Routes.commonSearch)?.then((value) {});
                  },
                  editController: controller.searchTextController,
                  focusNode: controller.searchFocus,
                  borderRadius: 12,
                  prefixWidget: SvgPicture.asset(
                    ImageConstants.icSearch,
                    height: 20,
                    width: 20,
                    matchTextDirection: true,
                  ).paddingOnly(left: 0, top: 15, bottom: 15),
                  suffixWidget: controller.searchText.value.isNotEmpty
                      ? Transform.rotate(
                          angle: math.pi / 4,
                          child: Icon(Icons.add, size: 28, color: ColorConstants.greyColor).onTap(() {
                            controller.searchTextController.clear();
                            controller.searchText.value = '';
                          }),
                        )
                      : SizedBox.shrink(),
                  labelText: 'searchEvents'.tr,
                  onChange: (_) {},
                  onValidate: (_) => null,
                  onChangeDebounceDuration: Duration(milliseconds: 300),
                  onDebounceChange: (value) {
                    // Perform Search Here
                  },
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
        16.vBox,
        Obx(() {
          final user = controller.user.value;
          return Container(
            height: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), gradient: CommonComponents.primaryPurpleGradient),
            child: Marquee(
              text: '${'welcomeBack'.tr} ${user?.user.name ?? ''}',
              style: AppThemeState().textStyleRegular(ColorConstants.whiteColor, fontSize: 14),
              pauseAfterRound: Duration(seconds: 0),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              blankSpace: 150.0,
              startPadding: 10.0,
              accelerationCurve: Curves.linear,
              decelerationCurve: Curves.easeOut,
            ),
          ).paddingSymmetric(horizontal: 16);
        }),

        16.vBox,

        // Grade Selection Section
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
          child: Column(
            children: [
              buildGradeDropdownRow(
                gradeItems: controller.gradeList,
                selectionType: GradeSelectionType.single,
                onTap: (grade) {
                  controller.onGradeChanged(grade);
                },
              ),
              16.vBox,
            ],
          ),
        ),

        // Stream Selection Section (for grades 11 and 12)
        Obx(() {
          return controller.isStreamVisible.value
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
                  child: Column(
                    children: [
                      buildStreamDropdownRow(
                        streamOptions: controller.selectedGradeStreams,
                        selectedStreamId: controller.selectedStream, // ✅ pass the RxInt

                        onTap: (streamId) {
                          controller.onStreamChanged(streamId);
                        },
                      ),
                      16.vBox,
                    ],
                  ),
                )
              : SizedBox.shrink();
        }),

        Obx(() {
          if (controller.isSubjectListLoading.value) {
            return Column(children: [_buildExamPackageShimmer(), 16.vBox]);
          }

          if (controller.examsList.value.isEmpty) {
            return Column(
              children: [
                CommonHeaderView(title: 'coursePackage'.tr, showViewAll: false),
                Center(
                  child: Text(
                    'lblNoData'.tr,
                    style: AppThemeState().textStyleRegular(ColorConstants.whiteColor, fontSize: 16),
                  ).paddingOnly(top: 45),
                ),
              ],
            );
          }

          return Column(
            children: [
              CommonHeaderView(
                title: 'examPackage'.tr,
                onViewAllTap: () {
                  Get.toNamed(Routes.examPackageList);
                },
                // showViewAll:
                //     controller.homeResponse.value?.examViewAll ??
                //     false,
              ),
              10.vBox,
              Padding(
                padding: const EdgeInsetsGeometry.directional(start: 16),
                child: SizedBox(
                  height: 84,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return 12.hBox;
                    },
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = controller.examsList.value[index];
                      return Padding(
                        padding: EdgeInsetsGeometry.directional(end: index == controller.examsList.value.length - 1 ? 16 : 0),
                        child: CommonExamCard(
                          item: item,
                          onTap: () {
                            Get.toNamed(
                              Routes.examDetail,
                              arguments: {ArgumentsConst.courseName: item.name, ArgumentsConst.examId: item.id},
                            );
                          },
                        ),
                      );
                    },
                    itemCount: controller.examsList.value.length,
                  ),
                ),
              ),
              16.vBox,
            ],
          );
        }),

        // Exam Package Section
        // if (controller.examsList.value.isNotEmpty) ...[
        //   CommonHeaderView(
        //     title: 'examPackage'.tr,
        //     onViewAllTap: () {
        //       Get.toNamed(Routes.examPackageList);
        //     },
        //     showViewAll: true,
        //   ),
        //   10.vBox,
        //   Padding(
        //     padding: const EdgeInsetsGeometry.directional(
        //       start: 16,
        //     ),
        //     child: SizedBox(
        //       height: 84,
        //       child: ListView.separated(
        //         separatorBuilder: (context, index) {
        //           return 12.hBox;
        //         },
        //         scrollDirection: Axis.horizontal,
        //         itemBuilder: (context, index) {
        //           final item = controller.examPackages[index];
        //           return Padding(
        //             padding: EdgeInsetsGeometry.directional(
        //               end:
        //                   index ==
        //                       controller.examPackages.length - 1
        //                   ? 16
        //                   : 0,
        //             ),
        //             child: CommonExamCard(
        //               item: item,
        //               onTap: () {
        //                 Get.toNamed(
        //                   Routes.courseDetail,
        //                   arguments: {
        //                     ArgumentsConst.courseName: item.title,
        //                     // ArgumentsConst.courseId: 0,
        //                     ArgumentsConst.courseType:
        //                         CourseType.examPackage,
        //                   },
        //                 );
        //               },
        //             ),
        //           );
        //         },
        //         itemCount: controller.scheduleItems.length,
        //       ),
        //     ),
        //   ),
        //   16.vBox,
        // ],

        // Course Package Section
        Obx(() {
          if (controller.isSubjectListLoading.value) {
            return _buildCoursePackageShimmer();
          }

          if (controller.subjectList.value.isEmpty) {
            return Column(
              children: [
                16.vBox,
                CommonHeaderView(title: 'coursePackage'.tr, showViewAll: false),
                Center(
                  child: Text(
                    'lblNoData'.tr,
                    style: AppThemeState().textStyleRegular(ColorConstants.whiteColor, fontSize: 16),
                  ).paddingOnly(top: 45),
                ),
              ],
            );
          }
          return Column(
            children: [
              CommonHeaderView(
                title: 'coursePackage'.tr,
                onViewAllTap: () {
                  Get.toNamed(Routes.coursePackageList);
                },
                // showViewAll:
                //     controller
                //         .homeResponse
                //         .value
                //         ?.subjectsViewAll ??
                //     false,
              ),
              10.vBox,
              Padding(
                padding: const EdgeInsetsGeometry.directional(start: 16),
                child: SizedBox(
                  height: 172,
                  child: GenericCoursePackageGrid<SubjectModelResponse>(
                    items: controller.subjectList.value,
                    isGrid: false,
                    onTap: (model) {
                      Get.toNamed(
                        Routes.courseDetail,
                        arguments: {
                          ArgumentsConst.courseName: model.name,
                          ArgumentsConst.courseId: model.id,
                          ArgumentsConst.courseType: CourseType.coursePackage,
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }),
        20.vBox,
      ],
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/core/theme/color_constants.dart';
import '../../core/routes/app_pages.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Welcome Back',style: TextStyle(color: Colors.white),),
        backgroundColor: ColorConstants.primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined,color: Colors.white),
            onPressed: () {
              Get.toNamed(Routes.checkOut);
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings,color: Colors.white),
            onPressed: () {
              Get.toNamed(Routes.settings);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top: View All
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Products",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // View All Action
                  },
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(Routes.coursePackageList);
                    },
                    child: const Text(
                      "View All",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Product List
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ProductCard(
                    productName: 'Product ${index + 1}',
                    price: '₹ ${100 * (index + 1)}',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String price;

  const ProductCard({
    super.key,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text(productName, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(price, style: const TextStyle(color: Colors.grey)),
        trailing: ElevatedButton(
          onPressed: () {
            // Add to cart
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstants.primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text("Add",style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

