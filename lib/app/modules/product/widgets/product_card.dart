import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.i,
  });

  final int i;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.PRODUCT_DETAIL),
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
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
              ),
            ),
            Gaps.vertical.s,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBold(
                  text: "Nama Produk $i",
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
