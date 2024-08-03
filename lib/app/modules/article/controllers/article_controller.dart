import 'package:get/get.dart';

import '../../../data/api/article/data/get_articles.dart';
import '../../../data/api/article/model/model_articles.dart';

class ArticleController extends GetxController {
  Rx<ModelArticles?> articles = Rx<ModelArticles?>(null);

  RxBool isLoading = true.obs;
  RxBool isError = true.obs;

  @override
  Future<void> onInit() async {
    isError.value = false;
    isLoading.value = true;
    final response = await getArticles();
    if (response.data != null) {
      articles.value = response.data;
    } else {
      isError.value = true;
    }
    isLoading.value = false;
    super.onInit();
  }
}
