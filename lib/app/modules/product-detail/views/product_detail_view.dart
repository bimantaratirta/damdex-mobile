import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_icon.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../controllers/product_detail_controller.dart';
import '../widgets/product_detail_description.dart';
import '../widgets/product_detail_features.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> with SingleTickerProviderStateMixin {
  final controller = Get.find<ProductDetailController>();
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppIcon(width: 80),
        centerTitle: true,
      ),
      body: Obx(() {
        final product = controller.produk.value;
        final isError = controller.isError.value;
        final isLoading = controller.isLoading.value;
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
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 125,
              child: Image.network(
                APIPath.assetId(product?.idAsset ?? ""),
                fit: BoxFit.contain,
              ),
            ),
            TabBar(
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: AppColors.accent,
              unselectedLabelColor: AppColors.accent.withOpacity(.7),
              indicatorColor: AppColors.accent,
              overlayColor: WidgetStatePropertyAll<Color>(AppColors.accent.withOpacity(.1)),
              indicatorWeight: 4,
              labelPadding: const EdgeInsets.all(Sizes.r),
              tabs: const [
                TextBold(
                  text: "Deskripsi",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                TextBold(
                  text: "Fitur",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  ProductDetailDescription(description: product?.deskripsi ?? ""),
                  ProductDetailFeatures(features: product?.listFitur ?? []),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
