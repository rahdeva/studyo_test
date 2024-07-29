import 'package:get/get.dart';
import 'package:studyo_test/feature/home/home_binding.dart';
import 'package:studyo_test/feature/home/home_page.dart';
import 'package:studyo_test/feature/splash/splash_screen.dart';

import 'page_names.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: PageName.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: PageName.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
