import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../data/api/article/model/model_articles.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/iso_parser.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
  });

  final Artikel article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.ARTICLE_DETAIL),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: Sizes.s, horizontal: Sizes.m),
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.sr,
          vertical: Sizes.s,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(Sizes.xs)),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(.025),
              offset: const Offset(0, 2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 160,
              height: 90,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                APIPath.assetId(article.idAsset ?? ""),
                fit: BoxFit.cover,
              ),
            ),
            Gaps.horizontal.r,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBold(
                    text: article.judul ?? "-",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    isoParser(article.updatedAt?.toIso8601String()),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  AppButton(
                    type: ButtonType.elevated,
                    padding: EdgeInsets.zero,
                    fixedSize: const Size(100, 25),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(Sizes.xs),
                    ),
                    onPressed: () => Get.toNamed(Routes.ARTICLE_DETAIL),
                    child: const Text(
                      "Selengkapnya",
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
