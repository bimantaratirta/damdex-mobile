import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../data/api/article/model/model_articles.dart';
import '../../../data/api/product/model/model_get_products.dart';
import '../../../data/api/settings/model/model_settings.dart';
import '../../../data/api/usage/model/model_get_usages.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../../article/controllers/article_controller.dart';
import '../../article/widgets/article_card.dart';
import '../../home/controllers/home_controller.dart';
import '../../usages/controllers/usages_controller.dart';
import '../../usages/widgets/usage_card.dart';
import '../controllers/product_controller.dart';
import '../widgets/product_card.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return RefreshIndicator(
      onRefresh: () async {
        await controller.onInit();
        await Get.find<UsagesController>().onInit();
        await Get.find<ArticleController>().onInit();
      },
      child: Obx(() {
        final banners = controller.banners;
        final currentBanner = controller.currentBanner.value;
        final isLoading = controller.isLoading.value;
        final isError = controller.isError.value;
        final products = controller.products.value;
        final usages = (Get.find<UsagesController>().usages.value?.payload ?? []).take(2).toList();
        final articles = (Get.find<ArticleController>().articles.value?.payload ?? []).take(4).toList();
        final homeController = Get.find<HomeController>();
        if (isLoading) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                Gaps.vertical.m,
                if (isError)
                  AppButton(
                    type: ButtonType.elevated,
                    onPressed: controller.onInit,
                    child: const Text("Refresh"),
                  ),
              ],
            ),
          );
        }
        return ListView(
          children: [
            if (banners.isNotEmpty)
              CarouselSlider(
                carouselController: controller.carouselController,
                items: (banners).map((banner) {
                  return SizedBox(
                    height: 150,
                    width: size.width,
                    child: CachedNetworkImage(
                      imageUrl: APIPath.assetId(banner.value ?? ""),
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 150,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 8),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0,
                  onPageChanged: (idx, reaseon) {
                    controller.setCurrentBanner(banners[idx]);
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            if (banners.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Sizes.r, horizontal: Sizes.m),
                child: Row(
                  children: [
                    for (Payload banner in banners) ...[
                      InkWell(
                        onTap: () => controller.setCurrentBanner(banner),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: currentBanner == banner ? AppColors.grey : AppColors.lightGrey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Gaps.horizontal.s,
                    ]
                  ],
                ),
              ),
            Gaps.vertical.s,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.m, vertical: Sizes.r),
              child: TextBold(
                text: "Produk Kami",
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            for (Produk product in products?.payload ?? []) ...[
              ProductCard(product: product),
            ],
            Gaps.vertical.s,
            InkWell(
              onTap: () => homeController.persistentTabController.jumpToTab(1),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.m, vertical: Sizes.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextBold(
                      text: "Cara Pakai",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            for (Usage usage in usages) ...[
              UsageCard(usage: usage),
            ],
            Gaps.vertical.s,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.m, vertical: Sizes.r),
              child: TextBold(
                text: "Artikel Terbaru",
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            for (Artikel article in articles) ...[
              ArticleCard(article: article),
            ],
            Gaps.vertical.m,
          ],
        );
      }),
    );
  }
}
