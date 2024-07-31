// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/article-detail/bindings/article_detail_binding.dart';
import '../modules/article-detail/views/article_detail_view.dart';
import '../modules/article/bindings/article_binding.dart';
import '../modules/article/views/article_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/product-detail/bindings/product_detail_binding.dart';
import '../modules/product-detail/views/product_detail_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/toko/bindings/toko_binding.dart';
import '../modules/toko/views/toko_view.dart';
import '../modules/usage-detail/bindings/usage_detail_binding.dart';
import '../modules/usage-detail/views/usage_detail_view.dart';
import '../modules/usages/bindings/usages_binding.dart';
import '../modules/usages/views/usages_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.USAGES,
      page: () => const UsagesView(),
      binding: UsagesBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE,
      page: () => const ArticleView(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: _Paths.TOKO,
      page: () => const TokoView(),
      binding: TokoBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.USAGE_DETAIL,
      page: () => const UsageDetailView(),
      binding: UsageDetailBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE_DETAIL,
      page: () => const ArticleDetailView(),
      binding: ArticleDetailBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
