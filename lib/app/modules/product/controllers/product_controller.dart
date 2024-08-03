import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../../../data/api/settings/data/get_settings.dart';
import '../../../data/api/settings/model/model_settings.dart';

class ProductController extends GetxController {
  Rx<ModelSettings?> settings = Rx<ModelSettings?>(null);
  CarouselController carouselController = CarouselController();
  RxList<Payload> banners = <Payload>[].obs;
  Rx<Payload?> currentBanner = Rx<Payload?>(null);

  void setCurrentBanner(Payload banner) {
    currentBanner.value = banner;
    carouselController.jumpToPage(banners.indexOf(banner));
  }

  @override
  Future<void> onInit() async {
    final response = await getSettings();
    if (response.data != null) {
      settings.value = response.data;
      banners.value = response.data?.payload ?? [];
      currentBanner.value = response.data?.payload?[0];
    }
    super.onInit();
  }
}
