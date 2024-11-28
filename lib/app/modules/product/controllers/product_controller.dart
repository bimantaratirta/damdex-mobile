import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../../../data/api/about/data/get_about.dart';
import '../../../data/api/about/model/model_about.dart';
import '../../../data/api/product/data/get_products.dart';
import '../../../data/api/product/model/model_get_products.dart';
import '../../../data/api/settings/data/get_settings.dart';
import '../../../data/api/settings/model/model_settings.dart';
import '../../../data/api/videos/data/get_videos.dart';
import '../../../data/api/videos/model/model_videos.dart';

class ProductController extends GetxController {
  Rx<ModelSettings?> settings = Rx<ModelSettings?>(null);
  Rx<ModelGetProducts?> products = Rx<ModelGetProducts?>(null);
  Rx<ModelAbout?> about = Rx<ModelAbout?>(null);
  Rx<Videos?> videos = Rx<Videos?>(null);
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
    getSettings().then((responseSettings) {
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
    });

    getAbout().then((responseAbout) {
      if (responseAbout.data != null) {
        about.value = responseAbout.data;
      } else {
        isError.value = true;
      }
    });

    getVideos(qp: {"limit": 4}).then((responseVideos) {
      if (responseVideos.data != null) {
        videos.value = responseVideos.data;
      } else {
        isError.value = true;
      }
    });

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
