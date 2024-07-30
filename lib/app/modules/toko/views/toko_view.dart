import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../controllers/toko_controller.dart';
import '../widgets/toko_card.dart';

class TokoView extends GetView<TokoController> {
  const TokoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(Sizes.m),
          child: Column(
            children: [
              AppTextField(
                label: const Text("Provinsi"),
                isError: false,
                focusNode: controller.provinsiFN,
                controller: controller.provinsiC,
              ),
              Gaps.vertical.r,
              AppTextField(
                label: const Text("Kota"),
                isError: false,
                focusNode: controller.kotaFN,
                controller: controller.kotaC,
              ),
              Gaps.vertical.r,
              const Divider(
                height: 0,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.m),
            children: [
              const TextBold(
                text: "Distributor",
                fontWeight: FontWeight.w500,
                fontSize: Sizes.m,
              ),
              Gaps.vertical.r,
              for (var _ in [1, 2, 3, 4, 5]) ...[
                const TokoCard(),
                Gaps.vertical.sr,
              ],
              Gaps.vertical.l,
              const TextBold(
                text: "Retailer",
                fontWeight: FontWeight.w500,
                fontSize: Sizes.m,
              ),
              Gaps.vertical.r,
              for (var _ in [1, 2, 3, 4, 5]) ...[
                const TokoCard(),
                Gaps.vertical.sr,
              ],
            ],
          ),
        ),
      ],
    );
  }
}
