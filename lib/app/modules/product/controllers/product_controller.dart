import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  CarouselController carouselController = CarouselController();

  RxList<String> banners = ["assets/dummy/banner1.jpg", "assets/dummy/banner2.jpg"].obs;
  Rx<String> currentBanner = "assets/dummy/banner.jpg".obs;
  void setCurrentBanner(String banner) {
    currentBanner.value = banner;
    carouselController.jumpToPage(banners.indexOf(banner));
  }
}
