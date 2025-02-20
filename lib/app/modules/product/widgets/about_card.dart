import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/about/model/model_about.dart';
import '../../../data/api/api_path.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({
    super.key,
    required this.about,
  });

  final ModelAbout about;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.ABOUT),
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
              color: AppColors.black.withValues(alpha: .025),
              offset: const Offset(0, 2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CachedNetworkImage(
                imageUrl: APIPath.assetId(about.idAsset ?? ""),
                fit: BoxFit.contain,
              ),
            ),
            Gaps.vertical.s,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBold(
                  text: about.judul ?? "-",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Detail",
                      style: TextStyle(color: AppColors.primary, fontSize: 14),
                    ),
                    Gaps.horizontal.xs,
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 12,
                    ),
                    Gaps.horizontal.xs,
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
