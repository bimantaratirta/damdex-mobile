import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../data/api/product/model/model_get_products.dart';
import '../../../data/api/settings/model/model_settings.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../../article/widgets/article_card.dart';
import '../../usages/widgets/usage_card.dart';
import '../controllers/product_controller.dart';
import '../widgets/product_card.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return RefreshIndicator(
      onRefresh: controller.onInit,
      child: Obx(() {
        final banners = controller.banners;
        final currentBanner = controller.currentBanner.value;
        final isLoading = controller.isLoading.value;
        final isError = controller.isError.value;
        final products = controller.products.value;
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
                    child: Image.network(
                      APIPath.assetId(banner.value ?? ""),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.m, vertical: Sizes.r),
              child: TextBold(
                text: "Cara Pakai",
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            for (var i in [1, 2]) ...[
              UsageCard(i: i),
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
            for (var i in [1, 2, 3, 4]) ...[
              ArticleCard(i: i),
            ],
            Gaps.vertical.m,
          ],
        );
      }),
    );
  }
}
