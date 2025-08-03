import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/user_model_response/user_model_response.dart';
import '../../theme/app_theme.dart';
import '../../theme/color_constants.dart';
import '../../theme/font_constants.dart';
import '../enum/grade_selection_enum.dart';
import '../repository/local_data/local_data_source.dart';

class GradeSelector extends StatelessWidget {
  final List<GradeModel> grades;
  final RxList<int>? selectedGrades;
  final RxInt? selectedGrade;
  final GradeSelectionType selectionType;
  final Function(GradeModel grade)? onTap;
  final bool isProfileScreen;
  final bool? isLoading;
  final LocalDataSource? localDataSource;

  const GradeSelector({
    super.key,
    required this.grades,
    this.isProfileScreen = false,
    this.selectedGrades,
    this.selectedGrade,
    this.localDataSource,
    required this.selectionType,
    this.onTap,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final isWrap = isProfileScreen;

    return isWrap
        ? Wrap(spacing: 10, runSpacing: 10, children: grades.map((grade) => _buildGradeItem(grade)).toList())
        : SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: (isLoading ?? false) ? 8 : grades.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, index) => _buildGradeItem(grades[index], index: index),
            ),
          );
  }

  Widget _buildGradeItem(GradeModel grade, {int? index}) {
    // If id is null, skip rendering this grade
    if (grade.id == null) {
      return const SizedBox.shrink();
    }

    final id = grade.id!;

    return Obx(() {
      final isSelected = selectionType == GradeSelectionType.single
          ? (selectedGrade?.value == id)
          : (selectedGrades?.contains(id) ?? false);

      return GestureDetector(
        onTap: () async {
          if (selectionType == GradeSelectionType.multiple) {
            if (isSelected) {
              selectedGrades?.remove(id);
            } else {
              selectedGrades?.add(id);
            }

            if (isProfileScreen && localDataSource != null) {
              await localDataSource!.setData('selected_grades', selectedGrades?.toList() ?? []);
            }
          } else {
            selectedGrade?.value = id;
          }
          onTap?.call(grade);
        },
        child: Padding(
          padding: EdgeInsetsDirectional.only(end: index == grades.length - 1 ? 16 : 0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isProfileScreen ? (isSelected ? ColorConstants.primaryColor : ColorConstants.secondaryButtonColor) : null,
              gradient: !isProfileScreen && isSelected
                  ? const LinearGradient(
                      colors: [ColorConstants.primaryColor, ColorConstants.secondaryColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              border: Border.all(color: ColorConstants.borderColor, width: 1),
            ),
            child: Text(
              grade.name ?? '',
              textAlign: TextAlign.center,
              style: AppThemeState().textStyleRegular(
                isSelected ? ColorConstants.whiteColor : ColorConstants.greyColor,
                fontSize: FontConstants.font_14,
              ),
            ),
          ),
        ),
      );
    });
  }
}
