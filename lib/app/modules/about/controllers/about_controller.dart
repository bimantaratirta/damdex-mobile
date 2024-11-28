import 'package:get/get.dart';

import '../../../data/api/about/data/get_about.dart';
import '../../../data/api/about/model/model_about.dart';

class AboutController extends GetxController {
  final Rx<ModelAbout?> about = Rx<ModelAbout?>(null);
  Map<String, dynamic> location = {};
  String deviceName = "";

  RxBool isLoading = false.obs;
  RxBool isError = false.obs;

  @override
  Future<void> onInit() async {
    isLoading.value = true;

    final response = await getAbout();
    if (response.data != null) {
      about.value = response.data;
      // LocationService.getCurrentLocation().then((location) {
      //   getDeviceInfo().then((deviceName) {
      //     postUserLog({
      //       "device": deviceName,
      //       "lokasi": location,
      //       "tipeKonten": "about",
      //     });
      //   });
      // });
    } else {
      Get.back();
    }
    isLoading.value = false;
    super.onInit();
  }
}
