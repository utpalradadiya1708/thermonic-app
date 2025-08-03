import 'package:get/get.dart';
import 'package:thermonic/pages/checkout/checkout_bindings.dart';
import 'package:thermonic/pages/checkout/checkout_view.dart';
import 'package:thermonic/pages/cms/contact_us/contact_us_binding.dart';
import 'package:thermonic/pages/cms/contact_us/contact_us_view.dart';
import 'package:thermonic/pages/common_search/common_search_bindings.dart';
import 'package:thermonic/pages/common_search/common_search_view.dart';
import 'package:thermonic/pages/course_package_list/course_package_list_bindings.dart';
import 'package:thermonic/pages/dashboard/dashboard_bindings.dart';
import 'package:thermonic/pages/dashboard/dashboard_view.dart';
import 'package:thermonic/pages/login/login_bindings.dart';
import 'package:thermonic/pages/login/login_view.dart';
import 'package:thermonic/pages/my_order/my_order_bindings.dart';
import 'package:thermonic/pages/my_order/my_order_view.dart';
import 'package:thermonic/pages/otp/otp_bindings.dart';
import 'package:thermonic/pages/otp/otp_view.dart';
import 'package:thermonic/pages/product_detail/product_detail_binding.dart';
import 'package:thermonic/pages/product_detail/product_detail_view.dart';
import 'package:thermonic/pages/profile_setup/profile_setup_bindings.dart';
import 'package:thermonic/pages/profile_setup/profile_setup_view.dart';
import 'package:thermonic/pages/setting/setting_bindings.dart';
import 'package:thermonic/pages/setting/setting_view.dart';

import '../../pages/cms/cms_binding.dart';
import '../../pages/cms/faq_view.dart';
import '../../pages/cms/privacy_policy_view.dart';
import '../../pages/cms/terms_and_conditions_view.dart';
import '../../pages/course_package_list/course_package_list_view.dart';
import '../../pages/onboarding/onboarding_bindings.dart';
import '../../pages/onboarding/onboarding_view.dart';
import '../../pages/splash/splash_bindings.dart';
import '../../pages/splash/splash_view.dart';
import '../common/widget/no_swipe_transition.dart';

part 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: _Paths.onBoarding,
      page: () => const OnBoardingView(),
      binding: OnBoardingBindings(),
      transitionDuration: Duration.zero,
    ),

    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: LoginBindings(),
    ),
    GetPage(name: _Paths.otp, page: () => OtpView(), binding: OtpBindings()),
    GetPage(
      name: _Paths.profileSetup,
      page: () => const ProfileSetupView(),
      binding: ProfileSetupBindings(),
    ),
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBindings(),
    ),
    GetPage(
      name: _Paths.productDetail,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.checkOut,
      page: () => const CheckOutView(),
      binding: CheckOutBindings(),
    ),
    GetPage(
      name: _Paths.myOrder,
      page: () => const MyOrdersView(),
      binding: MyOrderBindings(),
    ),
    GetPage(
      name: Routes.settings,
      page: () =>  SettingView(),
      binding: SettingBindings(),
    ),
    GetPage(
      name: _Paths.coursePackageList,
      page: () => CoursePackageListView(),
      binding: CoursePackageListBindings(),
    ),
    GetPage(
      name: _Paths.privacyPolicy,
      page: () => PrivacyPolicyView(),
      binding: CmsBinding(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: _Paths.termsAndConditions,
      page: () => TermsAndConditionsView(),
      binding: CmsBinding(),
      transitionDuration: Duration.zero,
    ),
    // GetPage(
    //   name: _Paths.examPackageTab,
    //   page: () => MyPurchaseExamPackageView(),
    //   binding: MyPurchaseExamPackageBindings(),
    //   transitionDuration: Duration.zero,
    // ),

    GetPage(
      name: _Paths.contactUs,
      page: () => ContactUsView(),
      binding: ContactUsBinding(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: _Paths.faq,
      page: () => FaqView(),
      binding: CmsBinding(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: _Paths.commonSearch,
      page: () => CommonSearchView(),
      binding: CommonSearchBindings(),
      transitionDuration: Duration.zero,
    ),
  ];
}
