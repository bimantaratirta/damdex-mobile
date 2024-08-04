import 'package:get/get.dart';

import '../../../data/api/logs/data/post_user_log.dart';
import '../../../data/api/product/data/get_product.dart';
import '../../../data/api/product/model/model_get_product.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/get_device_info.dart';
import '../../../utils/location_service.dart';

class ProductDetailController extends GetxController {
  final Rx<ModelGetProduct?> produk = Rx<ModelGetProduct?>(null);
  Map<String, dynamic> location = {};
  String deviceName = "";

  Rx<Fitur?> selectedFeature = Rx<Fitur?>(null);
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;

  void setSelectedFeature(Fitur fitur) {
    if (selectedFeature.value == fitur) {
      selectedFeature.value = null;
    } else {
      selectedFeature.value = fitur;
    }
  }

  @override
  Future<void> onInit() async {
    isLoading.value = true;

    final response = await getProduct(Get.arguments ?? "null");
    if (response.data != null) {
      produk.value = response.data;
    } else {
      Get.offNamed(Routes.HOME);
    }
    location = await LocationService.getCurrentLocation();
    deviceName = (await getDeviceInfo())["name"];
    await postUserLog({
      "device": deviceName,
      "lokasi": location,
      "tipeKonten": "produk",
      "idKonten": produk.value?.id,
    });
    isLoading.value = false;
    super.onInit();
  }
}
