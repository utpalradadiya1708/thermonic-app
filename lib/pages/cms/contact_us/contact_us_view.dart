import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/core/common/constants/app_constants.dart';
import 'package:thermonic/core/common/constants/image_constants.dart';
import 'package:thermonic/core/common/widget/common_card.dart';
import 'package:thermonic/core/common/widget/common_components.dart';
import 'package:thermonic/core/theme/app_theme.dart';
import 'package:thermonic/core/theme/color_constants.dart';
import 'package:thermonic/utils/widget_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/common/widget/common_appbar.dart';
import '../../../core/common/widget/common_background.dart';
import '../../../core/theme/app_size_constants.dart';
import 'contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Column(
        children: [
          CommonAppBar(text: 'lblContactUs'.tr),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.vBox,
                  _buildHeaderText(),
                  16.vBox,
                  _buildContactCards(),
                  16.vBox,
                  _buildSocialMediaSection(),
                ],
              ),
            ),
          ),
        ],
      ).marginSymmetric(horizontal: AppSizeConstants.size_15),
    );
  }

  Widget _buildHeaderText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'weLoveToHearFromYou'.tr,
          style: AppThemeState().textStyleRegular(
            ColorConstants.whiteColor,
            fontSize: 16,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        8.vBox,
        Text(
          'contactUsDescription'.tr,
          style: AppThemeState().textStyleRegular(
            ColorConstants.greyColor,
            fontSize: 12,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildContactCards() {
    return Row(
      children: [
        Expanded(
          child: _buildContactCard(
            icon: ImageConstants.icMail,
            title: 'callUs'.tr,
            subtitle: AppConstants.supportNumber,
            onTap: () => _launchPhone(AppConstants.supportNumber),
          ),
        ),
        17.hBox,
        Expanded(
          child: _buildContactCard(
            icon: ImageConstants.icMail,
            title: 'emailUs'.tr,
            subtitle: AppConstants.supportEmail,
            onTap: () {
              print(AppConstants.supportEmail);
              _launchEmail(AppConstants.supportEmail);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContactCard({
    required String icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return CommonCard(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIconContainer(icon),
          12.vBox,
          Text(
            title,
            style: AppThemeState().textStyleRegular(
              ColorConstants.whiteColor,
              fontSize: 16,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          8.vBox,
          Text(
            subtitle,
            style: AppThemeState().textStyleRegular(
              ColorConstants.greyColor,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    ).onTap(onTap);
  }

  Widget _buildSocialMediaSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'connectSocialMedia'.tr,
          style: AppThemeState().textStyleRegular(
            ColorConstants.whiteColor,
            fontSize: 16,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        8.vBox,
        _buildSocialMediaCard(
          icon: ImageConstants.icMail,
          title: 'instagram'.tr,
          subtitle:
              '${'instagramFollowers'.tr} \u2022 ${'instagramFollowers'.tr}',
        ).onTap(() => _launchURL(AppConstants.igLink)),
        16.vBox,
        _buildSocialMediaCard(
          icon: ImageConstants.icTelegram,
          title: 'telegram'.tr,
          subtitle: '${'telegramFollowers'.tr} \u2022 ${'telegramPosts'.tr}',
        ).onTap(() => _launchURL(AppConstants.tgLink)),
        16.vBox,
        _buildSocialMediaCard(
          icon: ImageConstants.icFacebook,
          title: 'facebook'.tr,
          subtitle: '${'facebookFollowers'.tr} \u2022 ${'facebookPosts'.tr}',
        ).onTap(() => _launchURL(AppConstants.fbLink)),
        16.vBox,
        _buildSocialMediaCard(
          icon: ImageConstants.icWhatsapp,
          title: 'whatsapp'.tr,
          subtitle: 'whatsappAvailability'.tr,
        ).onTap(() => _launchURL(AppConstants.whatsappLink)),
      ],
    );
  }

  Widget _buildSocialMediaCard({
    required String icon,
    required String title,
    required String subtitle,
  }) {
    return CommonCard(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          _buildIconContainer(icon),
          8.hBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppThemeState().textStyleRegular(
                    ColorConstants.whiteColor,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                6.vBox,
                Text(
                  subtitle,
                  style: AppThemeState().textStyleRegular(
                    ColorConstants.greyColor,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          8.hBox,
          Image.asset(
            ImageConstants.icLink,
            height: 20,
            width: 20,
            // matchTextDirection: true,
          ),
        ],
      ),
    );
  }

  Widget _buildIconContainer(String iconPath) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorConstants.primaryColor,
      ),
      child: Center(
        child: Image.asset(
          iconPath,
          height: 24,
          width: 24,
          // matchTextDirection: true,
        ),
      ),
    );
  }

  void _launchPhone(String phoneNumber) async {
    final uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      CommonComponents.displaySnackBarError('lblCallError'.tr);
    }
  }

  void _launchEmail(String email) async {
    final uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      CommonComponents.displaySnackBarError('lblEmailError'.tr);
    }
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      CommonComponents.displaySnackBarError('lblLinkError'.tr);
    }
  }
}
