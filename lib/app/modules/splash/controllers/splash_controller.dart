import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
// import '../../../utils/location_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 1));
    // LocationService.getCurrentLocation(isOnInit: true);
    Get.offAllNamed(Routes.HOME);
    super.onInit();
  }
}
