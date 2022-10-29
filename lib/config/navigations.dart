import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:thirumathikart_seller/bindings/home_bindings.dart';
import 'package:thirumathikart_seller/bindings/login_bindings.dart';
import 'package:thirumathikart_seller/bindings/profile_bindings.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/views/home_page.dart';
import 'package:thirumathikart_seller/views/login.dart';
import 'package:thirumathikart_seller/views/profile.dart';

class NavigationPages {
  static List<GetPage<dynamic>> getPages() => [
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
          name: NavigationRoutes.profileRoute,
          page: () => const ProfilePage(),
          binding: ProfileBindings(),
        ),
      ];
}
