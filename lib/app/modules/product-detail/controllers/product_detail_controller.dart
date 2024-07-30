import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  List<int> features = [0, 1, 2, 3, 4, 5];

  RxInt selectedFeature = 0.obs;

  void setSelectedFeature(int val) {
    if (selectedFeature.value == val) {
      selectedFeature.value = 99;
    } else {
      selectedFeature.value = val;
    }
  }
}
