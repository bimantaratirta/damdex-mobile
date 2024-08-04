import 'package:get/get.dart';

import '../../../data/api/usage/data/get_usages.dart';
import '../../../data/api/usage/model/model_get_usages.dart';

class UsagesController extends GetxController {
  Rx<ModelGetUsages?> usages = Rx<ModelGetUsages?>(null);

  RxBool isLoading = true.obs;
  RxBool isError = true.obs;

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    isError.value = false;
    final response = await getUsages();
    if (response.data != null) {
      usages.value = response.data;
    } else {
      isError.value = true;
    }
    isLoading.value = false;
    super.onInit();
  }
}
