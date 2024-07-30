import 'package:get/get.dart';

class UsageDetailController extends GetxController {
  List<int> types = [0, 1, 2];

  RxInt selectedType = 0.obs;

  void setSelectedType(int val) {
    if (selectedType.value == val) {
      selectedType.value = 99;
    } else {
      selectedType.value = val;
    }
  }
}
