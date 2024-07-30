import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../constants/sizes.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.i});

  final int i;

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
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
              ),
            ),
            Gaps.horizontal.r,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBold(
                    text: "Judul Artikel Yang Nomor $i",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    "1 Januari 2024",
                    style: TextStyle(
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
