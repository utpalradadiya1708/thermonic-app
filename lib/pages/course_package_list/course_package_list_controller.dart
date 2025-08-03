import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../core/common/constants/image_constants.dart';
import '../../core/common/widget/common_components.dart';
import '../../core/di/injector_container.dart';
import '../../core/services/api_service/configs.dart';
import '../../models/pagination_response/pagination_response.dart';
import '../../models/subject_model_response/subject_model_response.dart';
import '../../utils/helper/session_manager.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursePackageListController extends GetxController {
  final RxList<Map<String, dynamic>> productList = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> fullList = <Map<String, dynamic>>[].obs;

  final searchController = TextEditingController();
  final searchFocus = FocusNode();

  final RxBool isShimmerShow = true.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() async {
    isShimmerShow.value = true;

    await Future.delayed(const Duration(seconds: 1));

    final dummyProducts = [
      {
        'id': '1',
        'name': 'Product 1',
        'price': 250.0,
        'description': 'A premium quality pen with smooth ink flow.',
      },
      {
        'id': '2',
        'name': 'Product 2',
        'price': 400.0,
        'description': 'Wireless headphones with noise cancellation.',
      },
      {
        'id': '3',
        'name': 'Product 3',
        'price': 150.0,
        'description': 'Notebook with 200 ruled pages and hard cover.',
      },
      {
        'id': '4',
        'name': 'Product 4',
        'price': 320.0,
        'description': 'Durable backpack suitable for school and travel.',
      },
      {
        'id': '5',
        'name': 'Product 5',
        'price': 199.0,
        'description': 'Reusable eco-friendly water bottle (1L).',
      },
      {
        'id': '6',
        'name': 'Product 6',
        'price': 299.0,
        'description': 'LED desk lamp with adjustable brightness.',
      },
    ];

    fullList.assignAll(dummyProducts);
    productList.assignAll(dummyProducts);
    isShimmerShow.value = false;
  }


  void onSearchDebounced(String value) {
    final query = value.trim().toLowerCase();

    if (query.isEmpty) {
      productList.assignAll(fullList);
    } else {
      final filtered = fullList.where((item) {
        return item['name'].toString().toLowerCase().contains(query);
      }).toList();

      productList.assignAll(filtered);
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    searchFocus.dispose();
    scrollController.dispose();
    super.onClose();
  }
}


/*class CoursePackageListController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  final ScrollController scrollController = ScrollController();
  SubjectRepository subjectRepository = getIt<SubjectRepository>();
  final isShimmerShow = false.obs;
  final subjectResponse = Rx<SubjectModelResponse?>(null);

  final subjectList = Rx<List<SubjectModelResponse>>([]);
  final subjectPrice = ''.obs;
  final isOrdered = false.obs;
  Timer? _debounce;

  int totalPage = 0;
  int currentPage = 0;

  @override
  void onReady() {
    //getSubjects();
   *//* scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (totalPage > 0 && currentPage != totalPage) {
          getSubjects(isPagination: true);
        }
      }
    });*//*
    super.onReady();
  }

  void onSearchDebounced(String? value) {
    final trimmed = value?.trim() ?? '';

    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      currentPage = 0;
      if (trimmed.isEmpty || trimmed.length < 2) {
        getSubjects();
      } else {
        getSubjects(searchString: trimmed);
      }
    });
  }

  Future<void> getSubjects({
    bool isPagination = false,
    String? searchString,
  }) async {
    if (!isPagination) {
      isShimmerShow.value = true;
    } else {
      EasyLoading.show();
    }
    final userGradeData = await SessionManager.getUserGradeData();
    final session = await SessionManager.getSessionState();

    Map<String, dynamic> params = {
      ApiParamKey.page: (currentPage + 1).toString(),
      ApiParamKey.gradeId: userGradeData['selected_grade'],
      // ApiParamKey.streamId: userGradeData['selected_stream'],
      ApiParamKey.userId: session.user?.user.id,
    };
    if (userGradeData['selected_stream'] != 0) {
      params.addAll({ApiParamKey.streamId: userGradeData['selected_stream']});
    }
    if (searchString != null) {
      params.addAll({ApiParamKey.searchString: searchString});
    }
    final response = await subjectRepository.getSubjects(params: params);

    await response.fold(
      (failure) {
        if (!isPagination) {
          isShimmerShow.value = false;
        } else {
          EasyLoading.dismiss();
        }
        CommonComponents.displaySnackBarError(failure.message);
      },
      (response) async {
        if (!isPagination) {
          isShimmerShow.value = false;
        } else {
          EasyLoading.dismiss();
        }
        if (response.status) {
          PaginationResponse<SubjectModelResponse> paginationResponse =
              PaginationResponse.fromJsonWithDynamicKey(
                response.data as Map<String, dynamic>,
                (itemJson) => SubjectModelResponse.fromJson(
                  itemJson as Map<String, dynamic>,
                ),
              );
          if (!isPagination) {
            subjectList.value.clear();
            totalPage = 0;
            currentPage = 1;
            totalPage = paginationResponse.totalPages;
            print('paginationResponse.price ${paginationResponse.totalPages}');
            print('paginationResponse.price ${paginationResponse.price}');
            subjectList.value = paginationResponse.results.toList();
            subjectPrice.value = paginationResponse.price.toString() ?? '';
            isOrdered.value = paginationResponse.isOrdered ?? false;
          } else {
            currentPage++;
            subjectList.value.addAll(paginationResponse.results);
          }
          subjectList.refresh();
        } else {
          CommonComponents.displaySnackBarError(response.message);
        }
      },
    );
  }

  final coursePackages = [
    SubjectModelResponse(
      name: 'courseMathematicsTitle'.tr,
      image: ImageConstants.icMathematics,
      // gradientColors: [ColorConstants.gradient1, ColorConstants.gradient2],
    ),
    SubjectModelResponse(
      name: 'courseScienceTitle'.tr,
      image: ImageConstants.icScience,
      // gradientColors: [ColorConstants.gradient3, ColorConstants.gradient4],
    ),
    SubjectModelResponse(
      name: 'courseArabicTitle'.tr,
      image: ImageConstants.icArabicCourse,
      // gradientColors: [ColorConstants.gradient5, ColorConstants.gradient6],
    ),
    SubjectModelResponse(
      name: 'courseSocialStudiesTitle'.tr,
      image: ImageConstants.icSocialStudies,
      // gradientColors: [ColorConstants.gradient7, ColorConstants.gradient8],
    ),
    SubjectModelResponse(
      name: 'courseComputerTitle'.tr,
      image: ImageConstants.icComputer,
      // gradientColors: [ColorConstants.gradient9, ColorConstants.gradient10],
    ),
    SubjectModelResponse(
      name: 'courseLifeSkillsTitle'.tr,
      image: ImageConstants.icLifeSkills,
      // gradientColors: [ColorConstants.gradient11, ColorConstants.gradient12],
    ),
  ];

  @override
  void onClose() {
    _debounce?.cancel();
    searchController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}*/

