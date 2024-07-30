import 'package:get/get.dart';

import '../controllers/usages_controller.dart';

class UsagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsagesController>(
      () => UsagesController(),
    );
  }
}
