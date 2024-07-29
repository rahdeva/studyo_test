import 'package:get/get.dart';
import 'package:studyo_test/feature/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}









