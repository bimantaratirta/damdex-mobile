import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_icon.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/iso_parser.dart';
import '../controllers/article_detail_controller.dart';

class ArticleDetailView extends GetView<ArticleDetailController> {
  const ArticleDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppIcon(width: 80),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: controller.onInit,
        child: Obx(() {
          final article = controller.article.value;
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
              SizedBox(
                width: double.infinity,
                height: 125,
                child: Image.network(
                  APIPath.assetId(article?.idAsset ?? ""),
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Sizes.m),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBold(
                      text: article?.judul ?? "",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.primary,
                    ),
                    Gaps.vertical.s,
                    Text(
                      isoParser(article?.updatedAt?.toIso8601String()),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Gaps.vertical.r,
                    const Divider(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.m),
                child: HtmlWidget(
                  article?.body ?? "",
                  renderMode: RenderMode.column,
                  textStyle: const TextStyle(fontSize: 14),
                ),
              ),
              Gaps.vertical.l,
            ],
          );
        }),
      ),
    );
  }
}
