import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/location_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 2));
    await LocationService.getCurrentLocation();
    Get.offAllNamed(Routes.HOME);
    super.onInit();
  }
}
