import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/usage/model/model_usage.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../controllers/usage_detail_controller.dart';

class UsageTypeCard extends GetView<UsageDetailController> {
  const UsageTypeCard({super.key, required this.type});

  final Tipe type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => controller.setSelectedType(type),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: Sizes.s, horizontal: Sizes.r),
            color: AppColors.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBold(
                  text: type.judul ?? "",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.white,
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),
        Obx(() {
          final isOpen = controller.selectedType.value == type;
          return isOpen
              ? Container(
                  padding: const EdgeInsets.all(Sizes.s),
                  child: HtmlWidget(
                    type.body ?? "",
                    renderMode: RenderMode.column,
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                )
              : const SizedBox();
        })
      ],
    );
  }
}
