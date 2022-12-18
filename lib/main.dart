import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:thirumathikart_seller/config/navigations.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/services/api_service.dart';
import 'package:thirumathikart_seller/services/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(Thirumathikart());
}

Future<void> initServices() async {
  await Get.putAsync(() => StorageServices().initStorage());
  await Get.putAsync(() => ApiServices().initApi());
}

class Thirumathikart extends StatelessWidget {
  Thirumathikart({Key? key}) : super(key: key);
  final storage = Get.find<StorageServices>();
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(
            textTheme:
                GoogleFonts.brawlerTextTheme(Theme.of(context).textTheme)),
        debugShowCheckedModeBanner: false,
        initialRoute: NavigationRoutes.spalash,
        getPages: NavigationPages.getPages(),
      );
}
