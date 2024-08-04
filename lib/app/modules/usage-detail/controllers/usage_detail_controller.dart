import 'package:get/get.dart';

import '../../../data/api/logs/data/post_user_log.dart';
import '../../../data/api/usage/data/get_usage.dart';
import '../../../data/api/usage/model/model_usage.dart';
import '../../../utils/get_device_info.dart';
import '../../../utils/location_service.dart';

class UsageDetailController extends GetxController {
  final Rx<ModelUsage?> usage = Rx<ModelUsage?>(null);
  Map<String, dynamic> location = {};
  String deviceName = "";

  Rx<Tipe?> selectedType = Rx<Tipe?>(null);
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;

  void setSelectedType(Tipe tipe) {
    if (selectedType.value == tipe) {
      selectedType.value = null;
    } else {
      selectedType.value = tipe;
    }
  }

  @override
  Future<void> onInit() async {
    isLoading.value = true;

    final response = await getUsage(Get.arguments ?? "null");

    if (response.data != null) {
      usage.value = response.data;

      location = await LocationService.getCurrentLocation();
      deviceName = await getDeviceInfo();
      await postUserLog({
        "device": deviceName,
        "lokasi": location,
        "tipeKonten": "penggunaan",
        "idKonten": usage.value?.id,
      });
    } else {
      Get.back();
    }
    isLoading.value = false;
    super.onInit();
  }
}
