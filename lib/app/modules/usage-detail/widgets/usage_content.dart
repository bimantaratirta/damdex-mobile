import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/usage/model/model_usage.dart';
import '../controllers/usage_detail_controller.dart';
import 'usage_type_card.dart';

class UsageContent extends GetView<UsageDetailController> {
  const UsageContent({super.key, required this.usage});

  final ModelUsage? usage;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(Sizes.m),
          child: HtmlWidget(
            usage?.deskripsi ?? "",
            renderMode: RenderMode.column,
            textStyle: const TextStyle(fontSize: 14),
          ),
        ),
        ...(usage?.listTipe ?? []).map((type) => UsageTypeCard(type: type))
      ],
    );
  }
}
