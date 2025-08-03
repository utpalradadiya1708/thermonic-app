import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../core/common/repository/apis/common_repository.dart';
import '../../core/common/widget/common_components.dart';
import '../../core/di/injector_container.dart';
import '../../core/services/api_service/configs.dart';
import '../../models/common_search_model_response.dart';
import '../../models/pagination_response/pagination_response.dart';
import '../../utils/helper/session_manager.dart';

class CommonSearchController extends GetxController {
  final searchTextController = TextEditingController().obs;
  final FocusNode searchFocus = FocusNode();

  var isLoading = false.obs;
  final isShimmerShow = false.obs;
  final ScrollController scrollController = ScrollController();

  final commonSearchResultList = Rx<List<CommonSearchModelResponse>>([]);
  CommonRepository commonRepository = getIt<CommonRepository>();

  int totalPage = 0;
  int currentPage = 0;
  Timer? _debounce;

  @override
  void onReady() {
    // getCommonSearch();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (totalPage > 0 && currentPage != totalPage) {
          getCommonSearch(isPagination: true);
        }
      }
    });
    super.onReady();
  }

  Future<void> getCommonSearch({
    bool isPagination = false,
    String? searchString,
  }) async {
    if (!isPagination) {
      isShimmerShow.value = true;
    } else {
      EasyLoading.show();
    }
    final userGradeData = await SessionManager.getUserGradeData();

    print('userGradeData ${userGradeData}');
    Map<String, dynamic> params = {
      ApiParamKey.page: (currentPage + 1).toString(),
      ApiParamKey.gradeId: userGradeData['selected_grade'] ?? 1,
      // ApiParamKey.streamId: userGradeData['selected_stream'],
      ApiParamKey.searchString: searchString,
    };

    if (userGradeData['selected_stream'] != 0) {
      params.addAll({ApiParamKey.streamId: userGradeData['selected_stream']});
    }
    // if (searchString != null) {
    //   params.addAll({ApiParamKey.searchString: searchString});
    // }
    final response = await commonRepository.getCommonSearchList(params);

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
          PaginationResponse<CommonSearchModelResponse> paginationResponse =
              PaginationResponse.fromJson(
                response.data as Map<String, dynamic>,
                (itemJson) => CommonSearchModelResponse.fromJson(
                  itemJson as Map<String, dynamic>,
                ),
              );
          if (!isPagination) {
            commonSearchResultList.value.clear();
            totalPage = 0;
            currentPage = 1;
            totalPage = paginationResponse.totalPages;
            commonSearchResultList.value = paginationResponse.results.toList();
          } else {
            currentPage++;
            commonSearchResultList.value.addAll(paginationResponse.results);
          }
          commonSearchResultList.refresh();
        } else {
          // CommonComponents.displaySnackBarError(response.message);
        }
      },
    );
  }

  void onSearchDebounced(String? value) {
    final trimmed = value?.trim() ?? '';

    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      currentPage = 0;
      if (trimmed.isEmpty || trimmed.length < 2) {
        commonSearchResultList.value.clear();
        totalPage = 0;
        currentPage = 1;
        commonSearchResultList.refresh();

        return;
      } else {
        getCommonSearch(searchString: trimmed);
      }
    });
  }
}
