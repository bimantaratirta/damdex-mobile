import 'package:get/instance_manager.dart';

import '../modules/article/controllers/article_controller.dart';
import '../modules/product/controllers/product_controller.dart';
import '../modules/toko/controllers/toko_controller.dart';
import '../modules/usages/controllers/usages_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController());
    Get.put<UsagesController>(UsagesController());
    Get.put<ArticleController>(ArticleController());
    Get.put<TokoController>(TokoController());
  }
}
