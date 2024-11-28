import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_icon.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../controllers/usage_detail_controller.dart';
import '../widgets/usage_content.dart';
import '../widgets/usage_related.dart';

class UsageDetailView extends StatefulWidget {
  const UsageDetailView({super.key});

  @override
  State<UsageDetailView> createState() => _UsageDetailViewState();
}

class _UsageDetailViewState extends State<UsageDetailView> with SingleTickerProviderStateMixin {
  final controller = Get.find<UsageDetailController>();
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
        final usage = controller.usage.value;
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
              child: CachedNetworkImage(
                imageUrl: APIPath.assetId(usage?.idAsset ?? ""),
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
                  text: "Kegunaan",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                TextBold(
                  text: "Pemakaian Lain",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  UsageContent(usage: usage),
                  UsageRelated(usage: usage),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
