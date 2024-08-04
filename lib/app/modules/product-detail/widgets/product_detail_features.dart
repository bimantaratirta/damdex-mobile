import 'package:flutter/material.dart';

import '../../../data/api/product/model/model_get_product.dart';
import 'product_detail_feature_card.dart';

class ProductDetailFeatures extends StatelessWidget {
  const ProductDetailFeatures({super.key, required this.features});

  final List<Fitur> features;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [...features.map((feature) => ProductDetailFeatureCard(feature: feature))],
    );
  }
}
