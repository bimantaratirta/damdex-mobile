import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  CarouselController carouselController = CarouselController();

  RxList<Color> banners = [Colors.red, Colors.green, Colors.blue, Colors.pink].obs;
  Rx<Color> currentBanner = Colors.red.obs;
  void setCurrentBanner(Color color) {
    currentBanner.value = color;
    carouselController.jumpToPage(banners.indexOf(color));
  }
}
