import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants/image_constants.dart';

class CommonCheckBox extends GetView {
  const CommonCheckBox({
    required this.isChecked,
    required this.onTap,
    this.iconColor,
    super.key,
  });

  final bool isChecked;
  final Color? iconColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SvgPicture.asset(
        isChecked ? ImageConstants.icChecked : ImageConstants.icUnChecked,
        height: 16,
        width: 16,
        matchTextDirection: true,
        // colorFilter: ColorFilter.mode(
        //   iconColor ?? ColorConstants.transparentColor,
        //   BlendMode.srcIn,
        // ),
      ),
    );
  }
}
