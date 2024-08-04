import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../../../data/api/product/data/get_products.dart';
import '../../../data/api/product/model/model_get_products.dart';
import '../../../data/api/settings/data/get_settings.dart';
import '../../../data/api/settings/model/model_settings.dart';

class ProductController extends GetxController {
  Rx<ModelSettings?> settings = Rx<ModelSettings?>(null);
  Rx<ModelGetProducts?> products = Rx<ModelGetProducts?>(null);
  CarouselController carouselController = CarouselController();
  RxList<Payload> banners = <Payload>[].obs;
  Rx<Payload?> currentBanner = Rx<Payload?>(null);

  RxBool isError = false.obs;
  RxBool isLoading = false.obs;

  void setCurrentBanner(Payload banner) {
    currentBanner.value = banner;
    carouselController.jumpToPage(banners.indexOf(banner));
  }

  @override
  Future<void> onInit() async {
    isError.value = false;
    isLoading.value = true;
    final responseSettings = await getSettings();
    if (responseSettings.data != null) {
      settings.value = responseSettings.data;
      banners.value = responseSettings.data?.payload ?? [];
      if (responseSettings.data?.payload != null) {
        if ((responseSettings.data?.payload?.length ?? 0) > 0) {
          currentBanner.value = responseSettings.data?.payload?.first;
        }
      }
    } else {
      isError.value = true;
    }

    final responseProducts = await getProducts();
    if (responseProducts.data != null) {
      products.value = responseProducts.data;
    } else {
      isError.value = true;
    }
    isLoading.value = false;
    super.onInit();
  }
}
