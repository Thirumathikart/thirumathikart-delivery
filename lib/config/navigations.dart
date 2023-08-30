import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:thirumathikart_delivery/bindings/forgotPassword.dart';
import 'package:thirumathikart_delivery/bindings/home_bindings.dart';
import 'package:thirumathikart_delivery/bindings/login_bindings.dart';
import 'package:thirumathikart_delivery/bindings/orders_binding.dart';
import 'package:thirumathikart_delivery/bindings/past_orders_binding.dart';
import 'package:thirumathikart_delivery/bindings/splash_binding.dart';
import 'package:thirumathikart_delivery/bindings/todays_orders_bindings.dart';
import 'package:thirumathikart_delivery/bindings/profile_bindings.dart';
import 'package:thirumathikart_delivery/constants/navigation_routes.dart';
import 'package:thirumathikart_delivery/bindings/map_bindings.dart';
import 'package:thirumathikart_delivery/views/forgotPasswrod.dart';
import 'package:thirumathikart_delivery/views/map_page.dart';
import 'package:thirumathikart_delivery/views/home_page.dart';
import 'package:thirumathikart_delivery/views/login.dart';
import 'package:thirumathikart_delivery/views/orders_page.dart';
import 'package:thirumathikart_delivery/views/past_orders.dart';
import 'package:thirumathikart_delivery/views/splash.dart';
import 'package:thirumathikart_delivery/views/todays_orders.dart';
import 'package:thirumathikart_delivery/views/profile.dart';

class NavigationPages {
  static List<GetPage<dynamic>> getPages() => [
        GetPage(
          name: NavigationRoutes.spalash,
          page: () => const SplashPage(),
          binding: SplashBindings(),
        ),
        GetPage(
          name: NavigationRoutes.home,
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: NavigationRoutes.loginRoute,
          page: () => const LoginPage(),
          binding: LoginBindings(),
        ),
         GetPage(
          name: NavigationRoutes.forgotPassword,
          page: () => ForgotPasswordPage(),
          binding: forgotPasswordBindings(),
        ),
        GetPage(
          name: NavigationRoutes.profileRoute,
          page: () => const ProfilePage(),
          binding: ProfileBindings(),
        ),
        GetPage(
          name: NavigationRoutes.todaysOrdersRoute,
          page: () =>  TodaysOrdersPage(),
          binding: TodaysOrdersBindings(),
        ),
        GetPage(
          name: NavigationRoutes.pastOrdersRoute,
          page: () => const PastOrdersPage(),
          binding: PastOrdersBindings(),
        ),
        GetPage(
          name: NavigationRoutes.map,
          page: MapPage.new,
          binding: MapBindings(),
        ),
          GetPage(
          name: NavigationRoutes.myOrdersRoute,
          page: () => const OrdersPage(),
          binding: OrdersBindings(),
        ),
      ];
}
