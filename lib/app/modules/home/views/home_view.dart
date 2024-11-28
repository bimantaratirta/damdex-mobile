import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../shareds/widgets/app_icon.dart';
import '../../../theme/app_colors.dart';
import '../../article/views/article_view.dart';
import '../../product/views/product_view.dart';
import '../../toko/views/toko_view.dart';
import '../../usages/views/usages_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const AppIcon(width: 80),
      ),
      body: PersistentTabView(
        controller: controller.persistentTabController,
        resizeToAvoidBottomInset: true,
        screenTransitionAnimation: const ScreenTransitionAnimation(
          duration: Duration(milliseconds: 100),
        ),
        onTabChanged: controller.onTabChanged,
        tabs: [
          PersistentTabConfig(
            screen: const ProductView(),
            item: ItemConfig(
              title: "Beranda",
              activeForegroundColor: AppColors.primary,
              inactiveForegroundColor: AppColors.grey,
              textStyle: const TextStyle(fontSize: 11),
              icon: Obx(() {
                final isActive = controller.index.value == 0;
                return Icon(
                  Icons.home,
                  color: isActive ? AppColors.primary : AppColors.grey,
                  size: 24,
                );
              }),
            ),
          ),
          PersistentTabConfig(
            screen: const UsagesView(),
            item: ItemConfig(
              title: "Cara Pakai",
              activeForegroundColor: AppColors.primary,
              inactiveForegroundColor: AppColors.grey,
              textStyle: const TextStyle(fontSize: 11),
              icon: Obx(() {
                final isActive = controller.index.value == 1;
                return Image.asset(
                  "assets/icon/usage.png",
                  color: isActive ? AppColors.primary : AppColors.grey,
                );
              }),
            ),
          ),
          PersistentTabConfig(
            screen: const ArticleView(),
            item: ItemConfig(
              title: "Artikel",
              activeForegroundColor: AppColors.primary,
              inactiveForegroundColor: AppColors.grey,
              textStyle: const TextStyle(fontSize: 11),
              icon: Obx(() {
                final isActive = controller.index.value == 2;
                return Icon(
                  Icons.article,
                  color: isActive ? AppColors.primary : AppColors.grey,
                  size: 24,
                );
              }),
            ),
          ),
          PersistentTabConfig(
            screen: const TokoView(),
            item: ItemConfig(
              title: "Toko",
              activeForegroundColor: AppColors.primary,
              inactiveForegroundColor: AppColors.grey,
              textStyle: const TextStyle(fontSize: 11),
              icon: Obx(() {
                final isActive = controller.index.value == 3;
                return Icon(
                  Icons.location_on,
                  color: isActive ? AppColors.primary : AppColors.grey,
                  size: 24,
                );
              }),
            ),
          ),
        ],
        navBarBuilder: (NavBarConfig navBarConfig) {
          return Style6BottomNavBar(navBarConfig: navBarConfig);
        },
      ),
    );
  }
}
