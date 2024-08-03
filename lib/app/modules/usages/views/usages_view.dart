import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/usage/model/model_get_usages.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../controllers/usages_controller.dart';
import '../widgets/usage_card.dart';

class UsagesView extends GetView<UsagesController> {
  const UsagesView({super.key});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.onInit,
      child: Obx(() {
        final usages = controller.usages.value?.payload ?? [];
        final isLoading = controller.isLoading.value;
        final isError = controller.isError.value;
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.m, vertical: Sizes.r),
              child: TextBold(
                text: "Cara Pakai",
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            for (Usage usage in usages) ...[
              UsageCard(usage: usage),
            ],
          ],
        );
      }),
    );
  }
}
