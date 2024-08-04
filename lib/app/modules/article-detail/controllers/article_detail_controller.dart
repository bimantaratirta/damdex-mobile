import 'package:get/get.dart';

import '../../../data/api/article/data/get_article.dart';
import '../../../data/api/article/model/model_article.dart';
import '../../../data/api/logs/data/post_user_log.dart';
import '../../../utils/get_device_info.dart';
import '../../../utils/location_service.dart';

class ArticleDetailController extends GetxController {
  final Rx<ModelArticle?> article = Rx<ModelArticle?>(null);
  Map<String, dynamic> location = {};
  String deviceName = "";

  RxBool isLoading = false.obs;
  RxBool isError = false.obs;

  @override
  Future<void> onInit() async {
    isLoading.value = true;

    final response = await getArticle(Get.arguments ?? "null");
    if (response.data != null) {
      article.value = response.data;
      location = await LocationService.getCurrentLocation();
      deviceName = await getDeviceInfo();
      await postUserLog({
        "device": deviceName,
        "lokasi": location,
        "tipeKonten": "artikel",
        "idKonten": article.value?.id,
      });
    } else {
      Get.back();
    }
    isLoading.value = false;
    super.onInit();
  }
}
