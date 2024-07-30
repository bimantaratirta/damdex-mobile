import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../controllers/usages_controller.dart';
import '../widgets/usage_card.dart';

class UsagesView extends GetView<UsagesController> {
  const UsagesView({super.key});
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
          UsageCard(i: i),
        ],
      ],
    );
  }
}
