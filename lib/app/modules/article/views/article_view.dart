import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../controllers/article_controller.dart';
import '../widgets/article_card.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({super.key});
  @override
  Widget build(BuildContext context) {
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
        for (var i in [1, 2, 3, 4, 5]) ...[
          ArticleCard(i: i),
        ],
      ],
    );
  }
}
