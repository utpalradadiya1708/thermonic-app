
import 'package:get/get.dart';
import 'views/login/login_view.dart';
import 'views/signup/signup_view.dart';
import 'views/dashboard/dashboard_view.dart';
import 'views/product_list/product_list_view.dart';
import 'views/product_details/product_details_view.dart';
import 'views/cart/cart_view.dart';
import 'views/settings/settings_view.dart';
import 'views/orders/orders_view.dart';
import 'views/invoice/invoice_view.dart';
import 'views/order_status/order_status_view.dart';
import 'views/mode/mode_view.dart';

import 'controllers/login_controller.dart';
import 'controllers/signup_controller.dart';
import 'controllers/dashboard_controller.dart';
import 'controllers/product_list_controller.dart';
import 'controllers/product_details_controller.dart';
import 'controllers/cart_controller.dart';
import 'controllers/settings_controller.dart';
import 'controllers/orders_controller.dart';
import 'controllers/invoice_controller.dart';
import 'controllers/order_status_controller.dart';
import 'controllers/mode_controller.dart';

final List<GetPage> appRoutes = [
  GetPage(name: '/', page: () => const LoginView(), binding: BindingsBuilder(() => Get.put(LoginController()))),
  GetPage(name: '/signup', page: () => const SignupView(), binding: BindingsBuilder(() => Get.put(SignupController()))),
  GetPage(name: '/dashboard', page: () => const DashboardView(), binding: BindingsBuilder(() => Get.put(DashboardController()))),
  GetPage(name: '/products', page: () => const Product_listView(), binding: BindingsBuilder(() => Get.put(Product_listController()))),
  GetPage(name: '/product_details', page: () => const Product_detailsView(), binding: BindingsBuilder(() => Get.put(Product_detailsController()))),
  GetPage(name: '/cart', page: () => const CartView(), binding: BindingsBuilder(() => Get.put(CartController()))),
  GetPage(name: '/settings', page: () => const SettingsView(), binding: BindingsBuilder(() => Get.put(SettingsController()))),
  GetPage(name: '/orders', page: () => const OrdersView(), binding: BindingsBuilder(() => Get.put(OrdersController()))),
  GetPage(name: '/invoice', page: () => const InvoiceView(), binding: BindingsBuilder(() => Get.put(InvoiceController()))),
  GetPage(name: '/order_status', page: () => const Order_statusView(), binding: BindingsBuilder(() => Get.put(Order_statusController()))),
  GetPage(name: '/mode', page: () => const ModeView(), binding: BindingsBuilder(() => Get.put(ModeController()))),
];
