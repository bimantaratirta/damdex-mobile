import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controllers/product_detail_controller.dart';
import 'product_detail_feature_card.dart';

class ProductDetailFeatures extends GetView<ProductDetailController> {
  const ProductDetailFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [...controller.features.map((i) => ProductDetailFeatureCard(i))],
    );
  }
}
