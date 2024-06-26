import 'package:get/get.dart';
import 'package:inversiones/src/ui/pages/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  const SplashBinding();

  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
