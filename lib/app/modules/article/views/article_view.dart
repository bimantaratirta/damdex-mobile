import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/article/model/model_articles.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../controllers/article_controller.dart';
import '../widgets/article_card.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({super.key});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.onInit,
      child: Obx(() {
        final articles = controller.articles.value?.payload ?? [];
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
        return ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.m, vertical: Sizes.r),
              child: TextBold(
                text: "Artikel",
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            for (Artikel article in articles) ...[
              ArticleCard(article: article),
            ],
          ],
        );
      }),
    );
  }
}
