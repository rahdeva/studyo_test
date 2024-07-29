import 'package:get/get.dart';
import 'package:studyo_test/feature/flutter_android_native/flutter_android_native_binding.dart';
import 'package:studyo_test/feature/flutter_android_native/flutter_android_native_page.dart';
import 'package:studyo_test/feature/home/home_binding.dart';
import 'package:studyo_test/feature/home/home_page.dart';
import 'package:studyo_test/feature/profile/profile_binding.dart';
import 'package:studyo_test/feature/profile/profile_page.dart';

import 'page_names.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: PageName.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: PageName.PROFILE,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: PageName.FLUTTER_ANDROID_NATIVE,
      page: () => const FlutterAndroidNativePage(),
      binding: FlutterAndroidNativeBinding(),
    ),
  ];
}
