import 'package:get/get.dart';
import 'package:studyo_test/feature/flutter_android_native/flutter_android_native_controller.dart';

class FlutterAndroidNativeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FlutterAndroidNativeController>(FlutterAndroidNativeController());
  }
}









