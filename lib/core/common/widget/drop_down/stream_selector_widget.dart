import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../../../models/user_model_response/user_model_response.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/color_constants.dart';
import '../../repository/local_data/local_data_source.dart';

class StreamSelectorRow extends StatelessWidget {
  final List<StreamModel> streamOptions;
  final RxInt selectedStreamId;
  final bool isProfileScreen;
  final LocalDataSource? localDataSource;
  final Function(int streamId)? onStreamSelected;

  const StreamSelectorRow({
    super.key,
    required this.streamOptions,
    required this.selectedStreamId,
    this.localDataSource,
    this.isProfileScreen = false,
    this.onStreamSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final widgets = <Widget>[];

      for (final stream in streamOptions) {
        final isSelected = selectedStreamId.value == stream.id;

        widgets.add(
          Expanded(
            child:
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
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
                  child: Center(
                    child: Text(
                      stream.name ?? '',
                      textAlign: TextAlign.center,
                      style: AppThemeState().textStyleRegular(
                        isSelected ? ColorConstants.whiteColor : ColorConstants.secondaryButtonTextColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ).onTap(() async {
                  selectedStreamId.value = stream.id ?? 0;
                  onStreamSelected?.call(stream.id ?? 0);
                  if (isProfileScreen && localDataSource != null) {
                    await localDataSource!.setData('selected_stream', stream.id);
                  }
                }),
          ),
        );

        widgets.addIf(stream != streamOptions.last, 17.hBox);
      }

      return Row(children: widgets);
    });
  }
}
